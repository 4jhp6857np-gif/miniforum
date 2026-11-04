/*const btn = document.getElementById('btn');

btn.addEventListener('click', () => {
    alert('Bonjour depuis JavaScript !');
});*/

console.log("app.js chargé");
const LONGUEUR_MIN = 5;
const LONGUEUR_MAX = 80;
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
    if (titre.length == 0) {
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