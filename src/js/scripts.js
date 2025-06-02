function printR(p) {
    console.log("Inside printR...");
    console.log(p.items[1]);
};

const common = {
    printF: function(p) {
        console.log("Inside printF...");
        console.log(p.items[0]);
    }
};

$(document).ready(function(){

    console.log("Hello Jeetu");

    printR(jsonObject);

    common.printF(jsonObject);

    $.ajax({
        url: "http://localhost:8080/hello1",
        dataType: "json",
        success: function( response ) {
            console.log( response );
            $("#api").text(response.aa);
        }
    });

});