/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const usernameInput = document.getElementById("username");
const usernameError = document.getElementById("usernameError");
usernameInput.addEventListener("blur", () => {
    const username = usernameInput.value.trim();
    if (username === "")
        return;

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


let isPasswordValid = false;
let isConfirmPasswordValid = false;
let isEmailValid = false;
let isPhoneValid = false;

/* ===== REGEX ===== */
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/;
const phoneRegex = /^0\d{9}$/;

/* ===== PASSWORD ===== */
const passwordInput = document.getElementById("password");
const passwordError = document.getElementById("passwordError");

passwordInput.addEventListener("input", () => {
    const val = passwordInput.value;

    if (!passwordRegex.test(val)) {
        passwordError.textContent =
                "Mật khẩu ≥8 ký tự, có chữ hoa, thường, số & ký tự đặc biệt";
        passwordInput.classList.add("is-invalid");
        isPasswordValid = false;
    } else {
        passwordError.textContent = "";
        passwordInput.classList.remove("is-invalid");
        isPasswordValid = true;
    }
});

/* ===== CONFIRM PASSWORD ===== */
const confirmPasswordInput = document.getElementById("confirmPassword");
const confirmPasswordError = document.getElementById("confirmPasswordError");

confirmPasswordInput.addEventListener("input", () => {
    if (confirmPasswordInput.value !== passwordInput.value) {
        confirmPasswordError.textContent = "Mật khẩu không khớp";
        confirmPasswordInput.classList.add("is-invalid");
        isConfirmPasswordValid = false;
    } else {
        confirmPasswordError.textContent = "";
        confirmPasswordInput.classList.remove("is-invalid");
        isConfirmPasswordValid = true;
    }
});

/* ===== EMAIL ===== */
const emailInput = document.getElementById("email");
const emailError = document.getElementById("emailError");

emailInput.addEventListener("input", () => {
    if (!emailRegex.test(emailInput.value.trim())) {
        emailError.textContent = "Email không hợp lệ";
        emailInput.classList.add("is-invalid");
        isEmailValid = false;
    } else {
        emailError.textContent = "";
        emailInput.classList.remove("is-invalid");
        isEmailValid = true;
    }
});

/* ===== PHONE ===== */
const phoneInput = document.getElementById("phone");
const phoneError = document.getElementById("phoneError");

phoneInput.addEventListener("input", () => {
    if (!phoneRegex.test(phoneInput.value.trim())) {
        phoneError.textContent = "Số điện thoại không hợp lệ";
        phoneInput.classList.add("is-invalid");
        isPhoneValid = false;
    } else {
        phoneError.textContent = "";
        phoneInput.classList.remove("is-invalid");
        isPhoneValid = true;
    }
});


const urlParams = new URLSearchParams(window.location.search);
if (urlParams.get("success") === "true") {
    Swal.fire({
        icon: 'success',
        title: 'Signup successfully!',
        confirmButtonText: 'OK'
    }).then(() => {
        window.location.href = 'login';
    });
}
