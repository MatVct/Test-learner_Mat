*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${SERVEUR}         livraison3.testacademy.fr
${HOMEY URL}      http://${SERVEUR}/
${NAVIGATEUR}        Firefox
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}     xpath=(//a[contains(text(),'Se déconnecter')])[3]
${UTILISATEUR VALIDE}     robot
${MOT DE PASSE VALIDE}    robot
${UTILISATEUR INVALIDE}     ours
${MOT DE PASSE INVALIDE}    ours
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${BOUTON VALIDER}    css=.homey_login_button
${TITRE TABLEAU DE BORD}    Accueil - Livraison 3
${ZONE ERREUR}    css=#modal-login .error

*** Keywords ***

Ouvrir Le Navigateur Et Acceder A L'Application
    Open Browser    browser=${NAVIGATEUR}  
    Maximize Browser Window
    Go To     ${HOMEY URL}

Accéder A La Page De Connexion
    Click Link    ${LIEN SE CONNECTER}
    Wait Until Element Is Visible    ${CHAMP NOM UTILISATEUR}
    

Saisir le nom d'utilisateur
    [Arguments]    ${utilisateur valide}
    Click Element    ${CHAMP NOM UTILISATEUR}
    Input text   ${CHAMP NOM UTILISATEUR}    ${utilisateur valide}

Saisir le mot de passe
    [Arguments]    ${mot de passe}
    Input Password    ${CHAMP MOT DE PASSE}    ${mot de passe}

Soumettre le formulaire de connexion
    Click Button    ${BOUTON VALIDER}
    Wait Until Element Is Visible   ${CHAMP NOM UTILISATEUR}