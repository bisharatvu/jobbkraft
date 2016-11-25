var experienceDateToChildDive;

function editAboutMe () {

    $('#editAboutMe').modal('toggle');

    var val = gon.aboutMeText;
    if (val !== "") {
        document.getElementById("aboutMeTextArea").value = document.getElementById("aboutMeShowDiv").innerHTML;
    }
    //alert(val);
}

/*================= OPEN ADD EDUCATION MODEL START ==============================*/
function openAddEducationModel () {

    $('#editAboutMe').modal('toggle');

    var val = gon.aboutMeText;
    if (val !== "") {
        document.getElementById("aboutMeTextArea").value = val;
    }
    //alert(val);
}
/*================= OPEN ADD EDUCATION MODEL END ==============================*/

$(document).on('turbolinks:load', function(){
    experienceDateToChildDive = document.getElementById('experienceDateToChildDive');

    $('#user_freelancer_company').change(function() {
        if(document.getElementById('user_freelancer_company').checked) {
            $('#userCompanyInfoFields').removeClass('hidden');
        } else {
            $('#userCompanyInfoFields').addClass('hidden');
        }
    });

/*================= Show Hide experience_i_am_work_here START ==============================*/
    $('#experience_i_am_work_here').change(function() {
        if(document.getElementById('experience_i_am_work_here').checked) {
            if(document.getElementById('experienceDateToChildDive')){
                document.getElementById('experience_date_to').required = false;
                experienceDateToChildDive = document.getElementById('experienceDateToChildDive');
            }
            $('#experienceDateToChildDive').remove();
            document.getElementById('experienceDateToChildDive').remove();
        } else {
            $('#experienceDateToDive').append($(experienceDateToChildDive));
            document.getElementById('experience_date_to').required = true;
        }
    });
});
/*================= Show Hide experience_i_am_work_here END ==============================*/

/*================= OPEN ADD EDUCATION MODEL START ==============================*/
function submitEditEducationForm () {
    form = document.getElementById('editLanguageForm');
    $(form.form).submit();


}
function playme() {
    document.getElementById("video1").src = gon.video_url;
}
/*================= OPEN ADD EDUCATION MODEL END ==============================*/
/*================= Display Date Picker START ==============================*/

function datepicker2 (divSelector) {
    $(divSelector).datetimepicker({
        format: 'YYYY-MM-DD',
        icons: {
            time: "fa fa-clock-o fa-lg",
            date: "fa fa-calendar fa-lg",
            up: "fa fa-arrow-up",
            down: "fa fa-arrow-down",
            next: "fa fa-chevron-right",
            previous: "fa fa-chevron-left"
        }
    });
}
/*================= Display Date Picker END ==============================*/
/*================= Open Edit Other Profile Info Model START ==============================*/

function openOtherProfileInfoModel() {
    var user = gon.user;
    var userJobCategory = gon.userJobCategory;
    var userJobType = gon.userJobType;
    $('#editOtherProfileInfo').modal('toggle');

/*================= Filling User Account Info START ==============================*/
    if (user.user_freelancer_company){
        $('#userCompanyInfoFields').removeClass('hidden');
        document.getElementById('user_freelancer_company').checked = true;
        if (user.user_company_number){
            document.getElementById('user_company_number').value = user.user_company_number;
        }
        if (user.user_company_name){
            document.getElementById('user_company_name').value = user.user_company_name;
        }
    }
/*================= Filling User Account Info END ==============================*/

/*================= Filling User Category Info START ==============================*/
    if (userJobCategory){
        if (userJobCategory.administrative){
            document.getElementById('user_administrative').checked = true;
        }
        if (userJobCategory.brand_ambassador){
            document.getElementById('user_brand_ambassador').checked = true;
        }

        if (userJobCategory.customer_service){
            document.getElementById('user_customer_service').checked = true;
        }
        if (userJobCategory.data_entry){
            document.getElementById('user_data_entry').checked = true;
        }
        if (userJobCategory.delivery){
            document.getElementById('user_delivery').checked = true;
        }
        if (userJobCategory.event_staff){
            document.getElementById('user_event_staff').checked = true;
        }
        if (userJobCategory.warehousing){
            document.getElementById('user_warehousing').checked = true;
        }
        if (userJobCategory.general_labor){
            document.getElementById('user_general_labor').checked = true;
        }
        if (userJobCategory.market_research){
            document.getElementById('user_market_research').checked = true;
        }
        if (userJobCategory.marketing){
            document.getElementById('user_marketing').checked = true;
        }
        if (userJobCategory.merchandising){
            document.getElementById('user_merchandising').checked = true;
        }
        if (userJobCategory.sales){
            document.getElementById('user_sales').checked = true;
        }
        if (userJobCategory.software_testing){
            document.getElementById('user_software_testing').checked = true;
        }
        if (userJobCategory.volunteer){
            document.getElementById('user_volunteer').checked = true;
        }
        if (userJobCategory.washing){
            document.getElementById('user_washing').checked = true;
        }
        if (userJobCategory.other){
            document.getElementById('user_other').checked = true;
        }
    }

/*================= Filling User Category Info END ==============================*/
/*================= Filling User Job Type Info START ==============================*/
    if (userJobType.consultant){
        document.getElementById('user_consultant').checked = true;
    }
    if (userJobType.hire){
        document.getElementById('user_hire').checked = true;
    }
/*================= Filling User Job Type Info END ==============================*/
}
/*================= Open Edit Other Profile Info Model END ==============================*/
