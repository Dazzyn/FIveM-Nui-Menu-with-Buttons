$(function () {
    function display(bool) {
        if (bool) {
            $("#container").fadeIn(300);
        } else {
            $("#container").fadeOut(1);
        }
    }

    display(false)

    window.addEventListener("message", function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    //ESC = exit
    document.onkeyup = function (data) {
        if (data.which == 27) { // ESC
            $.post("https://menu/exit", JSON.stringify({}));
            console.log("exited")
            return
        }
    };
    $("#close").click(function () {
        $.post("https://menu/exit", JSON.stringify({}));
            return
    })
    $("#button2").click(function () {
        $.post("https://menu/button", JSON.stringify({}));
            return
    })
})