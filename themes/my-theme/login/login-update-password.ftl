
<#import "template.ftl" as layout>
<script>
    function togglePassword() {
        var x = document.getElementById("password-new");
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
        if (confirmPasswordInput.type === "password"){
            confirmPasswordInput.type = "text";
            visibilityIcon.src = "${url.resourcesPath}/img/eye.png";
        } else {
            confirmPasswordInput.type = "password";
            visibilityIcon.src = "${url.resourcesPath}/img/eye-off.png";
        }
    }
</script>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="update-password-container">
            <div class="logo-forgot-password">
                <img src="${url.
                resourcesPath}/img/Logo - Antica Pasticceria-05.svg" alt="Logo" rel="icon" width="300" height="80">
            </div>
            <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <h2 class="h2-update-password">Reset password</h2>
                <p class="p-update-password">La nuova password deve essere differente da quella precedente</p>
                <input class="input-update-password" type="text" id="username" name="username" value="${username}" autocomplete="username"
                       readonly="readonly" style="display:none;"/>
                <input class="input-update-password" type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-new" class="label-update-password">${msg("Password")}</label>
                    </div>
                    <div style="display: flex">
                        <input type="password" id="password-new" name="password-new" class="input-update-password"
                               autofocus autocomplete="new-password" placeholder="${msg("Password")}"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                        />
                        <label class="visibility" id="v" onclick="togglePassword()">
                            <img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="invalid-input" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>

                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="label-update-password">${msg("Conferma Password")}</label>
                    </div>
                    <div style="display: flex">
                        <input type="password" id="password-confirm" name="password-confirm"
                               class="input-update-password"
                               autocomplete="new-password"
                               placeholder="${msg("Conferma Password")}"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <label class="visibility" id="v-confirm" onclick="toggleConfirmPassword()">
                            <img id="vi-confirm" src="${url.resourcesPath}/img/eye-off.png">
                        </label>
                    </div>

                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="invalid-input" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>

                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if isAppInitiatedAction??>
                                <div class="checkbox">
                                    <label><input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked> ${msg("logoutOtherSessions")}</label>
                                </div>
                            </#if>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <#if isAppInitiatedAction??>
                            <input class="button-update-password" type="submit" value="${msg("Reset password")}" />
                            <button class="button-update-password" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                        <#else>
                            <input class="button-update-password" type="submit" value="${msg("Reset password")}" />
                        </#if>
                    </div>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>