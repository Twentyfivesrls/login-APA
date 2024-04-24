<#assign yourConditionToDetectMobile = true> <!-- o qualsiasi altra logica necessaria per rilevare mobile o desktop -->

<#assign isMobile = false>
<#if yourConditionToDetectMobile>
    <#assign isMobile = true>
</#if>

<#import "template.ftl" as layout>

<script>

    function togglePassword() {
        var x = document.getElementById("password");
        var v = document.getElementById("vi");
        if (x.type === "password") {
            x.type = "text";
            v.src = "${url.resourcesPath}/img/eye.png";
        } else {
            x.type = "password";
            v.src = "${url.resourcesPath}/img/eye-off.png";
        }
    }



</script>

<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password; section>
    <#if section = "title">
        ${msg("loginTitle", (realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap" rel="stylesheet">
    <#elseif section = "form">
<div class="login-container">
        <div class="logo">
        <img src="${url.
        resourcesPath}/img/Logo - Antica Pasticceria-05.svg" alt="Logo" rel="icon" width="300" height="80">
        </div>
        <#if realm.password>
        <div class="card" id="loginCard">
                <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <h2>Login</h2>

                    <label for="email">Email</label>
                    <input class="input-login" type="text" id="username" placeholder="${msg("Email")}" name="username" tabindex="1" autofocus autocomplete="off"
                           aria-invalid="<#if messagesPerField.existsError('username', 'password')>true</#if>">
                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                    </#if>
                        <label for="password">Password</label>
                    <div style="display: flex">
                    <input class="input-login" type="password" id="password" placeholder="${msg("Password")}" name="password" tabindex="2" autofocus autocomplete="off"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>">
                        <label class="visibility" id="v" onclick="togglePassword()">
                            <img id="vi" src="${url.resourcesPath}/img/eye-off.png">
                        </label>
                    </div>
                    <#if messagesPerField.existsError('username','password')>
                        <span id="input-error" class="invalid-input" aria-live="polite">
                            </span>
                    </#if>
                        <div class="forgot-password">
                        <#if realm.resetPasswordAllowed>
                            <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">Hai dimenticato la password?</a></span>
                        </#if>
                    </div>
                    <div>
                        <button type="submit" class="button-login">Accedi</button>
                    </div>
                    <p class="create-account">
                    <div id="kc-registration" style="display: inline-grid">
                        Devi ancora registrarti? <a href="${url.registrationUrl}" style="color: #525252" id="create-account-link">Crea un account</a>
                    </div>
                </form>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
