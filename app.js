/*const btn = document.getElementById('btn');

btn.addEventListener('click', () => {
    alert('Bonjour depuis JavaScript !');
});*/

console.log("app.js chargé");
console.log(document.querySelector("#sujets"))
const LONGUEUR_MIN = 5;
const LONGUEUR_MAX = 80;
const MESSAGE_MAX = 500;
const titres = [
    "Comment installer Node ?",
    "Les champs SQL",
    "Un De TEs TItreS  ",
    "Voici tous les paramètres de CSS",
    "Les prénoms, noms et emails des utilisateurs",
    "Quelles sont les différentes balises de HTML ?"
]

console.table(titres)

function titresTries(titres) {
    const tableau = [... titres ].sort((a, b) => a.localeCompare(b));
    return tableau;
}

function chercheDansTitres(titres,texte) {
    const titresContenantTexte = titres.filter(titre => titre.toLowerCase().includes(texte.toLowerCase()));
    return titresContenantTexte;
}

function titreExiste(titres, saisie) {
    const titreIdentique = titres.some(titre => titre.trim().toLowerCase() === saisie.trim().toLowerCase())
    return titreIdentique;
}

function validerTitre(titres, saisie) {
    const titre = saisie.trim();
    if (titre.length === 0) {
        return "Le titre est obligatoire";
    }
    if (titre.length < LONGUEUR_MIN) {
        return "Le titre doit faire au moins " + LONGUEUR_MIN + " caractères.";
    }
    if (titre.length > LONGUEUR_MAX) {
        return "Le titre ne doit pas dépasser " + LONGUEUR_MAX + " caractères.";
    }
    if (titreExiste(titres, titre)) {
        return "Ce sujet existe déjà";
    }
    return "";
}

/*
// -- tests de l'étape 4 --

console.log("--- etape 4 ---");
console.table(titresTries(titres));
console.log(titres[0]);
console.log(chercheDansTitres(titres, "sql"));
console.log(chercheDansTitres(titres, "licorne"));
console.log(titreExiste(titres, " GIT REFUSE MON PUSH "));
console.log(titreExiste(titres, "Un titre inventé"));
console.log();

// -- tests de l'étape 5 --

console.log("--- etape 5---");
console.log(validerTitre(titres, ""));
console.log(validerTitre(titres, "    "));
console.log(validerTitre(titres, "Git"));
console.log(validerTitre(titres, "a".repeat(81)));
console.log(validerTitre(titres, "UN DE TES TITRES"));
const reponse = validerTitre(titres, "Comment lire une erreur ?");
console.log("[" + reponse + "]");
*/

// Semaine 7
 
// Tes constantes et ton tableau titres
// Tes fonctions de la semaine 6 :
// titresTries
// chercheDansTitres
// titreExiste
// validerTitre

// Semaine 7

function carteSujet(titre) {
    const carte = document.createElement("article");
    carte.classList.add("carte-sujet");

    const h3 = document.createElement("h3");
    const lien = document.createElement("a");

    lien.href = "./sujet.html";
    lien.textContent = titre;

    h3.append(lien);
    carte.append(h3);

    return carte;
}

function afficherSujets(liste) {
    const section = document.querySelector("#sujets");

    section.querySelectorAll(".carte-sujet").forEach((carte) => {
        carte.remove();
    });

    for (const titre of liste) {
        section.append(carteSujet(titre));
    }
}

if (document.querySelector("#sujets") !== null) {
    afficherSujets(titres);
}

function validerPseudo(saisie) {
    if (saisie.trim() === "") {
        return "Le pseudo est obligatoire.";
    }
    return "";
}

function validerMessage(saisie) {
    const message = saisie.trim();
    if (message === "") {
        return "Le message est obligatoire.";
    }
    if (message.length > MESSAGE_MAX) {
        return "Le message ne doit pas dépasser " + MESSAGE_MAX + " caractères.";
    }
    return "";
}

// Démarrage
const formulaire = document.querySelector("#form-nouveau-sujet");

if (formulaire !== null) {

    const champTitre = document.querySelector("#titre");
    const champPseudo = document.querySelector("#pseudo");
    const champMessage = document.querySelector("#message");
    function afficherErreur(idMessage, texte) {
        document.querySelector(idMessage).textContent = texte;
    }

    formulaire.addEventListener("submit", (event) => {

        event.preventDefault();
        const saisiePseudo = champPseudo.value;
        const saisieTitre = champTitre.value;
        const saisieMessage = champMessage.value;
        const erreurPseudo = validerPseudo(saisiePseudo);
        const erreurTitre = validerTitre(titres, saisieTitre);
        const erreurMessage = validerMessage(saisieMessage);
        afficherErreur("#erreur-pseudo", erreurPseudo);
        afficherErreur("#erreur-titre", erreurTitre);
        afficherErreur("#erreur-message", erreurMessage);
        if (erreurPseudo !== "" || erreurTitre !== "" || erreurMessage !== "") {
            return;
        }
        titres.push(saisieTitre.trim());
        afficherSujets(titres);
        formulaire.reset();
        champPseudo.focus();
    });
}