var Media = {
    init: function() {
        this.getMeidaData("video"),
        this.setNav()
    },
    setNav: function() {
        $(".sub-nav-item,.sub-nav-item-small").on("click",
        function() {
            if (!$(this).hasClass("active")) {
                var a = $(this);
                a.addClass("active").siblings().removeClass("active");
                var b = a.attr("rel"),
                c = a.data("data");
                return c ? void Media.setPageHtml(b, c) : void Media.getMeidaData(b)
            }
        })
    },
    setMeidaHtml: function(a) {
        switch (a) {
        case "video":
            var b = ['<section id="videos-section" class="outter m-nav-pad videos-section-bg">', 
                     '<div class="inner" style="padding: 40px 0;">', "<h2>视频</h2>", 
                     '<ul media-gallery="videos" class="media-gallery">', "{@each video.videoList as item,index}",
                     '<li class="media-item {@if index < 2}m-lg{@/if}" data-mp4="${item.detailJson|toJson,"flvUrl"}" data-title="${item.title}" data-flv="${item.detailJson|toJson,"flvParam"}">',
                     '<div class="media-border">',
                     '<a href="javascript:;"  style="background-image: url(${item.detailJson|toJson,"index-thumb"})" title="${item.title}" class="media-content m-video"><div class="m-media-wp-span">${item.title}</div></a>',
                     "</div>", "</li>", "{@/each}", "</ul>", "</div>", "</section>"].join("");
            break;
        case "screenshots":
            var b = ['<section id="screenshots-section" class="outter m-nav-pad screenshots-section-bg">',
                     '<div class="inner" style="padding: 40px 0;">', "<h2>游戏截图</h2>",
                     '<ul media-gallery="screenshots" class="media-gallery">', "{@each mediaList as item,index}",
                     '<li class="media-item" data-title="${item.title}" data-large="${item.detailJson|toJson,"large"}" data-full="${item.detailJson|toJson,"full"}">',
                     '<div class="media-border">', '<a href="javascript:;" style="background-image: url(${item.detailJson|toJson,"index-thumb"})" title="${item.title}" class="media-content m-img"><div class="m-media-wp-span">${item.title}</div></a>',
                     "</div>", "</li>", "{@/each}", "</ul>", "</div>", "</section>"].join("");
            break;
        case "artwork":
            var b = ['<section id="artwork-section" class="outter m-nav-pad artwork-section-bg">',
                     '<div class="inner" style="padding: 40px 0;">', "<h2>原画</h2>", '<ul media-gallery="artwork" class="media-gallery">', 
                     "{@each mediaList as item,index}", '<li class="media-item" data-title="${item.title}" data-large="${item.detailJson|toJson,"large"}" data-full="${item.detailJson|toJson,"full"}">',
                     '<div class="media-border">', '<a href="javascript:;" style="background-image: url(${item.detailJson|toJson,"index-thumb"})" title="${item.title}" class="media-content m-img"><div class="m-media-wp-span">${item.title}</div></a>',
                     "</div>", "</li>", "{@/each}", "</ul>", "</div>", "</section>"].join("");
            break;
        case "wallpapers":
            var b = ['<section id="wallpapers-section" class="outter m-nav-pad wallpapers-section-bg">', 
                     '<div class="inner" style="padding: 40px 0;">', "<h2>壁纸</h2>", '<ul media-gallery="wallpapers" class="media-gallery">',
                     "{@each mediaList as item,index}", '<li class="media-item m-lg">', '<div class="media-border">',
                     '<div style="background-image: url(${item.detailJson|toJson,"index-thumb"})" title="${item.title}" class="media-content m-wallpaper">',
                     '<div class="m-media-wp-span">${item.title}</div>', "</div>", '<ul class="m-media-download-box clearfix">', "$${item.detailJson|setWallPic}", 
                     "</ul>", "</div>", "</li>", "{@/each}", "</ul>", "</div>", "</section>"].join("");
            break;
        case "reference":
            var b = ['<section id="references-section" class="outter m-nav-pad references-section-bg">',
                     '<div class="inner" style="padding: 40px 0;">', "<h2>资料专栏</h2>", '<ul media-gallery="references" class="media-gallery">',
                     "{@each mediaList as item,index}", '<li class="media-item">', '<div class="media-border">',
                     '<a href="${item.detailJson|toJson,"referenceLink"}" target="_blank" style="background-image: url(${item.detailJson|toJson,"index-thumb"})" class="media-content m-pdf">',
                     '<span class="size">${item.detailJson|toJson,"referenceSize"}</span>', '<div class="m-media-wp-span">${item.title}</div>',
                     "</a>", "</div>", "</li>", "{@/each}", "</ul>", "</div>", "</section>"].join("")
        }
        return juicer.register("toJson", Media.toJson),
        juicer.register("setWallPic", Media.setWallPic),
        b
    },
    toJson: function(a, b) {
        var c = JSON.parse(a);
        return c[b]
    },
    setWallPic: function(a) {
        for (var b = JSON.parse(a), c = [], d = "", e = {
            "2560x1440": {
                cls: "wide",
                text: "宽屏"
            },
            "2048x1536": {
                cls: "standard",
                text: "标准"
            },
            "2048x2048": {
                cls: "tablet",
                text: "平板"
            },
            "1080x1920": {
                cls: "mobile",
                text: "手机"
            }
        },
        f = 0; f < b.resolutionList.length; f++) {
            var g = b.resolutionList[f];
            for (var h in g) d = ["<li>", '<a href="' + g[h] + '" target="_blank" class="m-download-' + e[h].cls + '">',
                                  '<i class="icon-download"></i>', '<span class="type">' + e[h].text + "</span>", 
                                  '<span class="subtext">(' + h + ")</span>", "</a>", "</li>"].join(""), c.push(d)
        }
        return c.join("")
    },
    getMeidaData: function(a) {
        var b = a;
        "video" == b ? b = "": "",
        Common.getData("/action/media/" + b, "",
        function(b) {
            "success" == b.status && ($('li[rel="' + a + '"]').data("data", b),
            		Media.setPageHtml(a, b))
        },
        "json")
    },
    setPageHtml: function(a, b) {
        var c = juicer(Media.setMeidaHtml(a), b.data);
        $("#g-media").html(c),
        this.setPopVideo()
    },
    setPopVideo: function() {
        var a = [];
        $("[media-gallery='videos']>li").each(function(b) {
            var c = $(this),
            d = {
                video: c.attr("data-mp4"),
                flv: c.attr("data-flv"),
                width: "100%",
                height: "100%",
                title: c.attr("data-title")
            };
            a.push(d)
        }),
        new JV.popSlider("[media-gallery='videos']>li", {
            data: a
        });
        var b = [];
        $("[media-gallery='screenshots']>li").each(function(a) {
            var c = $(this),
            d = {
                pic: c.attr("data-full"),
                title: c.attr("data-title"),
                info: ""
            };
            b.push(d)
        }),
        new JV.popSlider("[media-gallery='screenshots']>li", {
            data: b
        });
        var c = [];
        $("[media-gallery='artwork']>li").each(function(a) {
            var b = $(this),
            d = {
                pic: b.attr("data-full"),
                title: b.attr("data-title"),
                info: ""
            };
            c.push(d)
        }),
        new JV.popSlider("[media-gallery='artwork']>li", {
            data: c
        })
    }
};