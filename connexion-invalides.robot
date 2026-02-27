*** Settings ***

Library    SeleniumLibrary
Resource   commun.resource
Task Setup  Ouvrir Le Navigateur Et Acceder A L'Application
Test Template   Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
Test Teardown    Close Browser

*** Test Cases ***

Test Utilisateur Vide Mot De Passe Vide    ${EMPTY}    ${EMPTY}
Test Utilisateur Valide Mot De Passe Vide                ${UTILISATEUR VALIDE}                 ${EMPTY}
Test Utilisateur Vide Mot De Passe Valide                ${EMPTY}              ${MOT DE PASSE VALIDE}
Test Utilisateur Invalide Mot De Passe Valide    ${UTILISATEUR INVALIDE}    ${MOT DE PASSE VALIDE}
Test Utilisateur Valide Mot De Passe Invalide    ${UTILISATEUR VALIDE}    ${MOT DE PASSE INVALIDE}
Test Utilisateur Invalide Mot De Passe Invalide    ${UTILISATEUR INVALIDE}    ${MOT DE PASSE INVALIDE}
   

*** Keywords ***

Vérifiez que le texte de la page du tableau de bord est visible
    Title Should Be    ${TITRE TABLEAU DE BORD}

Vérifier Que Le Message d'Erreur Est Visible
    Wait Until Element Is Visible    ${ZONE ERREUR}

Effectuer Une Déconnexion Réussie
    Wait Until Element Is Visible    ${LIEN SE DECONNECTER}
    Click Element   ${LIEN SE DECONNECTER}  

Vérifier Que le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN SE CONNECTER}

Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
    [Arguments]   ${nom_utilisateur}    ${mot_de_passe}
    Accéder A La Page De Connexion
    Saisir le nom d'utilisateur    ${nom_utilisateur}
    Saisir le mot de passe    ${mot_de_passe}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message d'Erreur Est Visible
