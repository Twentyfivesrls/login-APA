<#assign yourConditionToDetectMobile = true> <!-- o qualsiasi altra logica necessaria per rilevare mobile o desktop -->

<#assign isMobile = false>
<#if yourConditionToDetectMobile>
    <#assign isMobile = true>
</#if>

<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
    <#elseif section = "form">
        <div class="forgo-password-container">
            <div class="logo">
                <img src="${url.
                resourcesPath}/img/Logo - Antica Pasticceria-05.svg" alt="Logo" rel="icon" width="300" height="80">
            </div>
        <form id="kc-reset-password-form" class="form"  action="${url.loginAction}" method="post">
            <h2 class="h2-forgot-password">Recupero Password</h2>
            <p class="p-forgot-password">Inserisci la mail associata al tuo account e riceverai un link per resettare la tua password</p>
                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                    <label class="label-forgot-password" for="email">Email</label>
                    <input type="text" id="username" name="username" placeholder="${msg("Inserisci la tua email")}" class="input-forgot-password" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="invalid-input" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>

            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <button class="button-forgot-password" type="submit">
                    Invia
                </button>
            </div>

            <p class="create-account">
            <div id="kc-registration">
                <a style="color: #1A1660" href="${url.loginUrl}" id="create-account-link">Torna al login</a>
            </div>
            <div class="clearfix"></div>
        </form>
        </div>
    <#elseif section = "success" >
        <hr />
        ${msg("emailInstruction")?no_esc}
    </#if>
</@layout.registrationLayout>