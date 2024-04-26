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

    function toggleConfirmPassword() {
        var confirmPasswordInput = document.getElementById("password-confirm");
        var visibilityIcon = document.getElementById("vi-confirm")
        if (confirmPasswordInput.type === "password") {
            confirmPasswordInput.type = "text";
            visibilityIcon.src = "${url.resourcesPath}/img/eye.png";
        } else {
            confirmPasswordInput.type = "password";
            visibilityIcon.src = "${url.resourcesPath}/img/eye-off.png";
        }
    }
</script>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm', 'phone'); section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="body-container">
            <div class="register-container">
                <div class="register-logo">
                    <img src="${url.resourcesPath}/img/Logo - Antica Pasticceria-05.svg" alt="Logo" rel="icon"
                         width="300" height="80">
                </div>
                <form id="kc-register-form" class="form-container" action="${url.registrationAction}" method="post">
                    <h2>Registrazione</h2>
                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                        <div class="label-register">
                            <label for="firstName" class="${properties.kcLabelClass!}">${msg("Nome")}</label>
                        </div>
                        <input type="text" id="firstName" placeholder="${msg("Nome")}" class="input-register"
                               name="firstName" value="${(register.formData.firstName!'')}"
                               aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>">
                        <#if messagesPerField.existsError('firstName')>
                            <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('firstName'))?no_esc}
                            </span>
                        </#if>
                    </div>


                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                        <div class="label-register">
                            <label for="lastName" class="${properties.kcLabelClass!}">${msg("Cognome")}</label>
                        </div>
                        <input type="text" id="lastName" class="input-register" placeholder="${msg("Cognome")}"
                               name="lastName" value="${(register.formData.lastName!'')}"
                               aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>">
                        <#if messagesPerField.existsError('lastName')>
                            <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('lastName'))?no_esc}
                            </span>
                        </#if>

                    </div>

                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                        <div class="label-register">
                            <label for="email" class="${properties.kcLabelClass!}">${msg("Email")}</label>
                        </div>
                        <input type="text" id="email" class="input-register" placeholder="${msg("Email")}" name="email"
                               value="${(register.formData.email!'')}" autocomplete="email"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>">
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('phone',properties.kcFormGroupErrorClass!)}">
                        <div class="label-register">
                            <label for="user.attributes.dob"
                                   class="${properties.kcLabelClass!}">${msg("Numero di telefono")}</label>
                        </div>
                        <input type="text" id="user.attributes.dob" class="input-register"
                               placeholder="${msg("Numero di telefono")}" name="user.attributes.dob"
                               value="${(register.formData['user.attributes.phone']!'')}"
                               aria-invalid="<#if messagesPerField.existsError('phone')>true</#if>">
                        <#if messagesPerField.existsError('phone')>
                            <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${('phone')}
                            </span>
                        </#if>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class=" ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                            <div class=label-register">
                                <label for="username" class="label-register">${msg("username")}</label>
                            </div>
                            <input type="text" id="username" class="input-register" placeholder="${msg("Username")}"
                                   name="username" value="${(register.formData.username!'')}" autocomplete="username"/>
                        </div>
                    </#if>

                    <#if passwordRequired>

                        <label for="password">${msg("password")}</label>
                        <div style="display: flex">
                            <input type="password" id="password" class="input-register" placeholder="${msg("Password")}"
                                   name="password" autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password')>true</#if>">

                            <label class="visibility" id="v" onclick="togglePassword()">
                                <img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                        </div>
                        <#if messagesPerField.existsError('password','password-confirm')>
                            <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                            </span>
                        </#if>
                        <div class="${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                            <label for="password-confirm">${msg("Conferma Password")}</label>
                            <div style="display: flex">
                                <input type="password" id="password-confirm" placeholder="${msg("Conferma Password")}"
                                       class="input-register" name="password-confirm"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>">

                                <label class="visibility" id="v-confirm" onclick="toggleConfirmPassword()">
                                    <img id="vi-confirm" src="${url.resourcesPath}/img/eye-off.png">
                                </label>
                            </div>
                            <#if messagesPerField.existsError('password','password-confirm')>
                                <span id="input-error" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('password-confirm'))?no_esc}
                            </span>
                            </#if>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="form-group">
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </div>
                    </#if>

                    <div class="${properties.kcFormGroupClass!}">

                        <div id="kc-form-buttons">
                            <input id="RegisterButton" class="button-register" type="submit"
                                   value="${msg("Registrati")}"/>
                        </div>
                        <p class="create-account">
                        <div id="kc-registration" style="display: inline-grid">
                            Sei già registrato? <a style="color: #525252" href="${url.loginUrl}" style="color: #525252"
                                                   id="create-account-link">Torna al login</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>