function toggleForm(flag) {
    let inputs = $("input");
    for (let i = 0; i < inputs.length; i++) {
        inputs[i].disabled = flag;
    }
    let buttons = $(".form-btn");
    for (let i = 0; i < buttons.length; i++) {
        buttons[i].disabled = flag;
    }
    let selects = $("select");
    for (let i = 0; i < selects.length; i++) {
        selects[i].disabled = flag;
    }
    let anchors = $("a");
    for (let i = 0; i < anchors.length; i++) {
        anchors[i].style.pointerEvents = flag ? "none" : "auto";
    }
    if (flag) {
        let spinner = $(".spinner-border-sm")[0];
        spinner.classList.add("spinner-border");
    }
    else {
        let spinner = $(".spinner-border")[0];
        spinner.classList.remove("spinner-border");
    }
}