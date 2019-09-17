function showModal(id,url,item) {
    bootbox.confirm({
        message: '<p class="text-center">আপনি কি এই '+ item +' টি বাতিল করতে চান?</p>',
        title: item + " বাতিল",
        buttons: {
            confirm: {
                label: 'হ্যাঁ',
                className: 'btn-success'
            },
            cancel: {
                label: 'না',
                className: 'btn-danger'
            }
        },
        callback: function (result) {

            if(result == true){
                var data;
                $.ajax({
                    type:"POST",
                    url : url,
                    data : {
                        id: id
                    },
                    async: false,
                    success : function(response) {
                        if(response ==1)
                        {
                            data = response;
                            toastr.success(item +"টি সফলভাবে মুছে ফেলা হয়েছে ","সার্থক");
                            reload();
                        }
                        else if(response ==2)
                        {
                            toastr.error(" আপনি যে " + item + " টি মুছতে চাইছেন সেটির আরো শাখা /পদ আছে এই " + item + " টি মুছতে হলে এর নিচের সব শাখা/পদ প্রথমে মুছে নিন ","দুঃখিত");
                        }
                        else
                        {
                            toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                        }
                        $('.modal.in .modal-dialog').hide();
                        $(".modal.in .modal-dialog .btn").off("click");
                    },
                    error: function() {
                        $('.modal.in .modal-dialog').hide();
                        $(".modal.in .modal-dialog .btn").off("click");
                         toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "positionClass": "toast-bottom-right"
                    };
                    toastr.error(" সমস্যা হয়েছে, পুনরায় চেষ্টা করুন । ","দুঃখিত");
                    }
                });

            }else{
                $('.modal.in .modal-dialog').hide();
                $(".modal.in .modal-dialog .btn").off("click");
            }

        }
    });

}