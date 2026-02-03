/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const usernameInput = document.getElementById("username");
const usernameError = document.getElementById("usernameError");
usernameInput.addEventListener("blur", () => {
    const username = usernameInput.value.trim();
    if (username === "") return;

    fetch("check-username?username=" + encodeURIComponent(username))
        .then(res => res.text())
        .then(data => {
            data = data.trim();
            if (data === "EXISTS") {
                usernameError.textContent = "Tài khoản này không hợp lệ";
                usernameInput.classList.add("is-invalid");
            } else {
                usernameError.textContent = "";
                usernameInput.classList.remove("is-invalid");
            }
        })
        .catch(err => console.log(err));
});

