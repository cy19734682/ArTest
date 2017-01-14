package com.yush.ar.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.security.Key;
import java.security.Security;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

public class MyEncrypt{
	
	 private static String strDefaultKey = "cydsa312dadad2adad1";
	 
	    /** 加密工具 */
	    private Cipher encryptCipher = null;
	 
	    /** 解密工具 */
	    private Cipher decryptCipher = null;
	 
	    /**
	     * 将byte数组转换为表示16进制值的字符串， 如：byte[]{8,18}转换为：0813， 和public static byte[]
	     * hexStr2ByteArr(String strIn) 互为可逆的转换过程
	     *
	     * @param arrB
	     *            需要转换的byte数组
	     * @return 转换后的字符串
	     * @throws Exception
	     * 
	     */
	    public static String byteArr2HexStr(byte[] arrB) throws Exception {
	        int iLen = arrB.length;
	        // 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
	        StringBuffer sb = new StringBuffer(iLen * 2);
	        for (int i = 0; i < iLen; i++) {
	            int intTmp = arrB[i];
	            // 把负数转换为正数
	            while (intTmp < 0) {
	                intTmp = intTmp + 256;
	            }
	            // 小于0F的数需要在前面补0
	            if (intTmp < 16) {
	                sb.append("0");
	            }
	            sb.append(Integer.toString(intTmp, 16));
	        }
	        return sb.toString();
	    }
	 
	    /**
	     * 将表示16进制值的字符串转换为byte数组， 和public static String byteArr2HexStr(byte[] arrB)
	     * 互为可逆的转换过程
	     *
	     * @param strIn 需要转换的字符串
	     * @return 转换后的byte数组
	     * @throws Exception
	     *
	     */
	    public static byte[] hexStr2ByteArr(String strIn) throws Exception {
	        byte[] arrB = strIn.getBytes();
	        int iLen = arrB.length;
	 
	        // 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
	        byte[] arrOut = new byte[iLen / 2];
	        for (int i = 0; i < iLen; i = i + 2) {
	            String strTmp = new String(arrB, i, 2);
	            arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
	        }
	        return arrOut;
	    }
	 
	    /**
	     * 默认构造方法，使用默认密钥
	     *
	     * @throws Exception
	     */
	    public MyEncrypt() throws Exception {
	        this(strDefaultKey);
	    }
	 
	    /**
	     * 指定密钥构造方法
	     *
	     * @param strKey
	     *            指定的密钥
	     * @throws Exception
	     */
	    public MyEncrypt(String strKey) throws Exception {
	        Security.addProvider(new com.sun.crypto.provider.SunJCE());
	        Key key = getKey(strKey.getBytes());
	 
	        encryptCipher = Cipher.getInstance("DES");
	        encryptCipher.init(Cipher.ENCRYPT_MODE, key);
	 
	        decryptCipher = Cipher.getInstance("DES");
	        decryptCipher.init(Cipher.DECRYPT_MODE, key);
	    }
	 
	    /**
	     * 加密字节数组
	     *
	     * @param arrB
	     *            需加密的字节数组
	     * @return 加密后的字节数组
	     * @throws Exception
	     */
	    public byte[] encrypt(byte[] arrB) throws Exception {
	        return encryptCipher.doFinal(arrB);
	    }
	 
	    /**
	     * 加密字符串
	     *
	     * @param strIn
	     *            需加密的字符串
	     * @return 加密后的字符串
	     * @throws Exception
	     */
	    public String encrypt(String strIn) throws Exception {
	        return byteArr2HexStr(encrypt(strIn.getBytes()));
	    }
	 
	    /**
	     * 解密字节数组
	     *
	     * @param arrB
	     *            需解密的字节数组
	     * @return 解密后的字节数组
	     * @throws Exception
	     */
	    public byte[] decrypt(byte[] arrB) throws Exception {
	        return decryptCipher.doFinal(arrB);
	    }
	 
	    /**
	     * 解密字符串
	     *
	     * @param strIn
	     *            需解密的字符串
	     * @return 解密后的字符串
	     * @throws Exception
	     */
	    public String decrypt(String strIn) throws Exception {
	        try {
	            return new String(decrypt(hexStr2ByteArr(strIn)));
	        } catch (Exception e) {
	            return "";
	        }
	    }
	 
	    /**
	     * 从指定字符串生成密钥，密钥所需的字节数组长度为8位 不足8位时后面补0，超出8位只取前8位
	     *
	     * @param arrBTmp
	     *            构成该字符串的字节数组
	     * @return 生成的密钥
	     * @throws java.lang.Exception
	     */
	    private Key getKey(byte[] arrBTmp) throws Exception {
	        // 创建一个空的8位字节数组（默认值为0）
	        byte[] arrB = new byte[8];
	 
	        // 将原始字节数组转换为8位
	        for (int i = 0; i < arrBTmp.length && i < arrB.length; i++) {
	            arrB[i] = arrBTmp[i];
	        }
	 
	        // 生成密钥
	        Key key = new javax.crypto.spec.SecretKeySpec(arrB, "DES");
	 
	        return key;
	    }
	    
	    
	    public static String readAll(Reader rd) throws IOException {
	        StringBuilder sb = new StringBuilder();
	        int cp;
	        while ((cp = rd.read()) != -1) {
	          sb.append((char) cp);
	        }
	        return sb.toString();
	     }
	     
	    /**
	     * 通过URl返回JOSN
	     * @param url
	     * @return
	     * @throws IOException
	     * @throws JSONException
	     */
	    public static String get(String url) throws IOException, JSONException {
	        InputStream is = new URL(url).openStream();
	        try {
	          BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
	          String jsonText = readAll(rd);
	          //JSONObject json =JSON.parseObject(jsonText);
	          return jsonText;
	        } finally {
	          is.close();
	         // System.out.println("同时 从这里也能看出 即便return了，仍然会执行finally的！");
	        }
	      }
	    
	    
	   /**
	    * 通过URl发出post请求返回字符串
	    * @param path
	    * @return
	    * @throws Exception
	    */
		public static String post(String path) throws Exception{
			HttpURLConnection httpConn=null;
			BufferedReader in=null;
			PrintWriter out=null;
			try {
				URL url=new URL(path);
				httpConn=(HttpURLConnection)url.openConnection();
				httpConn.setRequestMethod("POST");
				httpConn.setDoInput(true);
				httpConn.setDoOutput(true);
				
				//发送post请求参数
				out=new PrintWriter(httpConn.getOutputStream());
				out.flush();
				//读取响应
				if(httpConn.getResponseCode()==HttpURLConnection.HTTP_OK){
					StringBuffer content=new StringBuffer();
					String tempStr="";
					in=new BufferedReader(new InputStreamReader(httpConn.getInputStream()));
					while((tempStr=in.readLine())!=null){
						content.append(tempStr);
					}
					return content.toString();
				}else{
					throw new Exception("请求出现了问题!");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				in.close();
				out.close();
				httpConn.disconnect();
			}
			return null;
		}
	    
	    
	    /**
         * 解析出参数中的键值对
         * 如 Action=del&id=123"，解析出Action:del,id:123存入map中
         * @author lzf
         */
        public static Map<String, String> paramSplit(String param){
            Map<String, String> mapRequest = new HashMap<String, String>();
            String[] arrSplit=null;
            arrSplit=param.split("[&]");
            for(String strSplit:arrSplit){
                  String[] arrSplitEqual=null;         
                  arrSplitEqual= strSplit.split("[=]");
                  //解析出键值
                  if(arrSplitEqual.length>1){
                      //正确解析
                      mapRequest.put(arrSplitEqual[0], arrSplitEqual[1]);
                  }else{
                      if(arrSplitEqual[0]!=""){
                      //只有参数没有值，不加入
                      mapRequest.put(arrSplitEqual[0], "");       
                      }
                  }
            }   
            return mapRequest;   
        }

}
