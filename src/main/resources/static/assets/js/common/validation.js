/**
 * Created by Bony on 10/23/2017.
 */
var FormValidation = function () {
    var e = function () {
            var e = $("#form_b"),
                r = $(".alert-danger", e),
                i = $(".alert-success", e);

            e.validate({
                errorElement: "span", errorClass: "help-block help-block-error",
                focusInvalid: !1, ignore: "", messages: {
                    select_multi: {
                        maxlength: jQuery.validator.format("Max {0} items allowed for selection"),
                        minlength: jQuery.validator.format("At least {0} items must be selected")
                    }
                }, rules: {

                    //app reg
                    appname: {
                        minlength: 2,
                        required: !0,
                        maxlength:55,
                        checkSpacedEngname: true,
                    },
                    appnamebng:{
                        minlength: 2,
                        required: !0,
                        maxlength:55,
                        checkSpacedBngname: true,
                    },
                    email: {
                        required: !0,
                        email: !0},
                    link: {
                        required: !0,
                        url: !0},
                    redirect_url: {
                        required: !0,
                        url: !0},
                    default_page_url: {
                        required: !0,
                        url: !0},
                    logout_url: {
                        required: !0,
                        url: !0},
                    mobile: {

                        number: !0,
                        minlength: 11,
                        maxlength:13,

                    },

                    digits: {required: !0, digits: !0},
                    select: {required: !0},
                    select_multi: {
                        required: !0, minlength: 1,
                        maxlength: 3
                    },
                    //end app reg

                    //geo div
                    divnameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:55,
                         checkEngname: true,

                    },
                    divnamebng:  {
                        required: true,
                        minlength: 3,
                        maxlength:55,
                        checkBngname: true,
                    },
                    bbscode: {
                        required: true,
                        minlength: 1,
                        maxlength:4,
                        number: !0,

                    },

                    //geo district
                    disnameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:15,
                        checkEngname: true,
                    },
                    disnamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:15,
                        checkBngname: true,
                    },


                    //geo upazilla

                    upazillanameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:15,
                        checkSpacedEngname: true,
                    },
                    upazillanamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:15,
                        checkSpacedBngname: true,
                    },
                     upazillabbscode:{
                        minlength: 1,
                         required: true,
                         maxlength:4,
                         number: !0,
                     },


                    //geocity

                    citynameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    citynamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true
                    },

                    //geo cityward

                    wardnameeng:
                        {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },

                    wardnamebng:
                        {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true,
                    },


                    //geo municipality
                    municipalitynameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    municipalitynamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true,
                    },
                    municipalitybbscode: {
                        minlength: 1,
                        required: true,
                        maxlength:4,
                        number: !0,
                    },



                    //geo municipality word
                    municipalitywardnameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    municipalitywardnamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true,
                    },
                    municipalitywardbbscode: {
                        minlength: 1,
                        required: true,
                        maxlength:4,
                        number: !0,
                    },


                    //geo thana

                    thananameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    thananamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,

                        checkSpacedBngname: true,
                    },

                    //geo union
                    unionnameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    unionnamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true,
                    },
                    unionbbscode: {
                        required: true,
                        minlength: 1,
                        maxlength:4,
                        number: !0,
                    },

                    //geo post office
                    postofficenameeng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,
                    },
                    postofficenamebng: {
                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedBngname: true,
                    },
                    postofficebbscode: {
                        required: true,
                        minlength: 1,
                        maxlength:4,
                        number: !0,
                    },

                    divdata: {
                        value: !-1,
                        required: !0
                    },

                    disdata: {
                        value: !-1,
                        required: !0
                    },

                    upadata: {
                        value: !-1,
                        required: !0
                    },

                    thadata: {
                        value: !-1,
                        required: !0
                    },

                    citydata: {
                        value: !-1,
                        required: !0
                    },

                    mundata: {
                        value: !-1,
                        required: !0
                    },




                    //addemployee
                    name_bng: {
                        required: true,
                        minlength: 1,
                        maxlength:50,
                        number: !0,
                    },
                    office_name_bng:{

                        required: true,
                        minlength: 3,
                        maxlength:25,
                        checkSpacedEngname: true,

                    }








                },  messages: {

                    appname: {
                        required: "ইংরেজিতে সিস্টেমের নাম দিন",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    appnamebng: {
                        required: "বাংলাতে সিস্টেমের নাম অবশ্যই দিতে হবে",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    email: {
                        required: "ইমেইল অবশ্যই দিতে হবে",
                        email: " সঠিক ইমেইল দিন"},
                    link: {
                        required: " সিস্টেমের ইউ আর এল অবশ্যই দিতে হবে",
                        url: !0},
                    redirect_url: {
                        required: "  ইউ আর এল অবশ্যই দিতে হবে",
                        url: !0},
                    default_page_url: {
                        required: "  ইউ আর এল অবশ্যই দিতে হবে",
                        url: !0},
                    logout_url: {
                        required: " ইউ আর এল অবশ্যই দিতে হবে",
                        url: !0},



                    divnameeng: {
                        required: "ইংরেজিতে বিভাগের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    divnamebng: {
                        required: "বাংলায় বিভাগের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    bbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: " ইংরেজিতে সঠিক নম্বর দিন",

                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন",

                    },
                    disnameeng: {
                        required: "ইংরেজিতে জেলার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    disnamebng: {
                        required: "বাংলায় জেলার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    upazillanameeng: {
                        required: "ইংরেজিতে উপজেলার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    upazillanamebng: {
                        required: "বাংলায় উপজেলার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    upazillabbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: "ইংরেজিতে সঠিক নম্বর দিন",
                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন"
                    },
                    citynameeng: {
                        required: "ইংরেজিতে সিটি কর্পোরেশন এর নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    citynamebng: {
                        required: "বাংলায় সিটি কর্পোরেশন এর নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    wardnameeng: {
                        required: "ইংরেজিতে সিটি কর্পোরেশন ওয়ার্ড এর নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    wardnamebng: {
                        required: "বাংলায় সিটি কর্পোরেশন ওয়ার্ড এর নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    municipalitynameeng: {
                        required: "ইংরেজিতে পৌরসভার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    municipalitynamebng: {
                        required: "বাংলায় পৌরসভার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    municipalitybbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: "ইংরেজিতে সঠিক নম্বর দিন",
                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন"
                    },


                    municipalitywardnameeng: {
                        required: "ইংরেজিতে পৌরসভা ওয়ার্ডের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    municipalitywardnamebng: {
                        required: "বাংলায় পৌরসভা ওয়ার্ডের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    municipalitywardbbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: "ইংরেজিতে সঠিক নম্বর দিন",
                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন"
                    },


                    thananameeng: {
                        required: "ইংরেজিতে থানার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    thananamebng: {
                        required: "বাংলায় থানার নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    unionnameeng: {
                        required: "ইংরেজিতে ইউনিয়নের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    unionnamebng: {
                        required: "বাংলায় ইউনিয়নের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    unionbbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: "ইংরেজিতে সঠিক নম্বর দিন",
                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন"
                    },

                    postofficenameeng: {
                        required: "ইংরেজিতে পোস্ট অফিসের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },

                    postofficenamebng: {
                        required: "বাংলায় পোস্ট অফিসের নাম দিন ",
                        minlength: "কমপক্ষে ৩ টি অক্ষর দিন",
                        maxlength: "১৫ টি অক্ষর এর কম দিন"
                    },
                    postofficebbscode: {
                        required: "ইংরেজিতে বিবিএস কোড দিন ",
                        number: "ইংরেজিতে সঠিক নম্বর দিন",
                        minlength: "কমপক্ষে ১ টি অক্ষর দিন",
                        maxlength: "৪ টি অক্ষর এর কম দিন"
                    },


                    divdata: {

                        required: "বিভাগ বাছাই করুন"
                    },

                    disdata: {

                        required: "জেলা বাছাই করুন"
                    },

                    upadata: {

                        required: "উপজেলা বাছাই করুন"
                    },

                    thadata: {

                        required: "থানা বাছাই করুন"
                    },

                    citydata: {

                        required: "সিটি কর্পোরেশন বাছাই করুন"
                    },

                    mundata: {

                        required: "পৌরসভা বাছাই করুন"
                    },


                    //addemployee
                    name_bng: {
                        required: "Name in Bangle is required",
                        minlength: "Enter atleast 1 Charecter",
                        maxlength: "Name in Bangle can not be over 50 Charecter"
                    },
                },
                invalidHandler: function (e, t) {
                    i.hide(), r.show(), App.scrollTo(r, -200)
                },
                highlight: function (e) {
                    $(e).closest(".form-group").addClass("has-error")
                },
                unhighlight: function (e) {
                    $(e).closest(".form-group").removeClass("has-error")
                },
                success: function (e) {
                    e.closest(".form-group").removeClass("has-error")

                },
                submitHandler: function (e) {
                    i.show(), r.hide(),e.submit()

                }
            });
        },

        t = function () {
            jQuery().wysihtml5 && $(".wysihtml5").size() > 0 && $(".wysihtml5").wysihtml5({stylesheets: ["../assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css"]})
        };
    $.validator.addMethod('checkEngname', function(value, element) {
        return this.optional(element) ||  (/^[a-zA-Z]*$/.test(value));

    }, "কোন বাংলা অক্ষর বা বিশেষ অক্ষর বা স্পেস গ্রহণযোগ্য নয় ");

    $.validator.addMethod('checkBngname', function(value, element) {
        return this.optional(element) || (!/\s/g.test(value)  &&!/[^\u0980-\u09ff]/.test(value));

    }, "কোন ইংরেজি অক্ষর বা বিশেষ অক্ষর বা নম্বর বা স্পেস গ্রহণযোগ্য নয় ");


    $.validator.addMethod('checkSpacedEngname', function(value, element) {
        return this.optional(element) || (/^[a-zA-Z\s]*$/.test(value));



    }, "কোন বাংলা অক্ষর বা বিশেষ অক্ষর বা নম্বর গ্রহণযোগ্য নয়");


    $.validator.addMethod('checkSpacedBngname', function(value, element) {
        return this.optional(element) || (!/[^\u0980-\u09ff!/\s]/.test(value));

    }, "কোন ইংরেজি অক্ষর বা বিশেষ অক্ষর বা নম্বর গ্রহণযোগ্য নয় ");



    return {
        init: function () {
            t(), e()
        }
    }
}();



jQuery(document).ready(function () {
    FormValidation.init()


});