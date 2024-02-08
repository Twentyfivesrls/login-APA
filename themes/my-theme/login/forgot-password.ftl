<#assign yourConditionToDetectMobile = true> <!-- o qualsiasi altra logica necessaria per rilevare mobile o desktop -->

<#assign isMobile = false>
<#if yourConditionToDetectMobile>
    <#assign isMobile = true>
</#if>

<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "form">
        <div class="forgot-password-container">
            <div class="logo">
                <img src="${url.
                resourcesPath}/img/Logo - Antica Pasticceria-05.svg" alt="Logo" rel="icon">
            </div>
        <form id="kc-reset-password-form" class="form reset-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <h2 class="h2-forgot-password">Recupero Password</h2>
            <p class="p-forgot-password">Inserisci la mail associata al tuo account e riceverai un link per resettare la tua password</p>
                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                    <label class="label-forgot-password" for="email">Email</label>
                    <input class="input-forgot-password" type="email" name="email" placeholder="Inserisci la tua email" required>
                </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#--  <a class="btn btn-default btn-flat btn-block" href="${url.loginUrl}"><i class="fa fa-caret-left"></i>&nbsp;&nbsp;${msg("backToLogin")}</a>  -->
                            <button class="button-forgot-password"  onclick="window.location.href = ${url.loginUrl}" formnovalidate>Invia
                                ${msg("backToLogin")?no_esc}
                            </button>
                    </div>
                </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#--  <input class="btn btn-primary btn-flat btn-block ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>  -->
                    <button class="button-forgot-password" type="submit">Invia
                        ${msg("doSubmit")?no_esc}
                    </button>
                </div>
            </div>
            <div class="clearfix"></div>
        </form>
        </div>
    <#elseif section = "info" >
        <hr />
        ${msg("emailInstruction")?no_esc}
    </#if>
</@layout.registrationLayout>