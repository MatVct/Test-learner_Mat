*** Settings ***
Library    SeleniumLibrary
Resource   commun.resource

*** Test Cases ***

Le Tableau De Bord Doit Etre Visible Apres Une Connexion Réussie
   [Setup]    Effectuer Une Connexion Réussi
   Vérifiez que le texte de la page du tableau de bord est visible
   [Teardown]    Effectuer Une Déconnexion Réussie

Le Lien De Connexion Devrais Etre Visible Après Une Deconnexion Réussie
   [Setup]    Effectuer Une Connexion Réussi
   Vérifiez que le texte de la page du tableau de bord est visible
   Effectuer Une Déconnexion Réussie
   Vérifier Que le Lien De Connexion Est Visible
   [Teardown]    Close All Browsers

*** Keywords ***

Effectuer Une Connexion Réussi
    Ouvrir Le Navigateur Et Acceder A L'Application
    Accéder A La Page De Connexion
    Saisir le nom d'utilisateur    ${UTILISATEUR VALIDE}
    Saisir le mot de passe    ${MOT DE PASSE VALIDE}
    Soumettre le formulaire de connexion



Vérifiez que le texte de la page du tableau de bord est visible
    Title Should Be    ${TITRE TABLEAU DE BORD}

#Vérifier Que Le Lien De Deconnexion Est Visible
    

Effectuer Une Déconnexion Réussie
    Wait Until Element Is Visible    ${LIEN SE DECONNECTER}
    Click Element   ${LIEN SE DECONNECTER}  

Vérifier Que le Lien De Connexion Est Visible
    Wait Until Element Is Visible    ${LIEN SE CONNECTER}




