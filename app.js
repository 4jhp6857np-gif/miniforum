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
    "Les fonctionnalités de JavaScript",
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

console.log("--- etape 4 ---");
console.table(titresTries(titres));
console.log(titres[0]);
console.log(chercheDansTitres(titres, "sql"));
console.log(chercheDansTitres(titres, "licorne"));
console.log(titreExiste(titres, " GIT REFUSE MON PUSH "));
console.log(titreExiste(titres, "Un titre inventé"));