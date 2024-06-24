#region<~~Chargement des éléments de l'interface graphique~~>
using namespace System.Collections
Add-Type -AssemblyName System.Collections
#endregion

function Show-Thanks {
    $list_Contributeurs = [ArrayList]::new(@(
        "Alex FALZON", 
        "Adrien ROCHE"
        "Zaide FLANDERS", 
        "Christophe TABARY", 
        "Guillaume CLUZEL", 
        "Louis LEMERLE", 
        "Haymadou NEMAGA", 
        "Abdessalem BENAROUS", 
        "Houdaifa GUEMOUR", 
        "Abdelhamid MEDIOUNA",
        "Radouane KHAIZ", 
        "Mohand ALIOUCHE", 
        "Stan AKE", 
        "Reaksmey CHIA", 
        "Joseph ABENGOYAP AKAME", 
        "Samuel POULADE", 
        "Yuanyuan Wensia MBOUKOU MAYELA"
        "Fany-Yolande MEKUI MVE",
        "Ignace-Roger SELVANADIN",
        "Hamza DOUKRY",
        "Benoit ANSEAUME",
        "Souleye MBAYE",
        "Souad TOUAT",
        "Léo COLIN",
        "Victor NOGIER",
        "Samuel IAZZA",
        "Yoann CHATIGNON",
        "Nicolas BODAINE",
        "Wilfried RAVISSOT",
        "Rachid GOUICEM-LAKHAL",
        "Kevin LIM",
        "Adrien MUHLHEIM",
        "Mikael COLINET",
        "Mathieu RAOUL-JOURDE"
    ))

    [void] $listView_Remerciement.Columns.Add("Contributeurs", 760)

    foreach ($person in $list_Contributeurs) {
        New-ListViewItem -Arg1 $person -ListView $listView_Remerciement
    }
}