$(document).ready(function(){

    $.ajax({
        url: '../API/read_forum.php',
        type: 'GET',
    })
    .done(function(res){

        console.log('RES: '+res);
        if (res == "fail")
            console.log("Error in query (API/read_forum.php)");
        else {

            var entradasJS = JSON.parse(res); 
            var cantEntradas = entradasJS.length;

            for(var i = 0; i < cantEntradas; i++){ 

                var newEntry = document.createElement("div");
                newEntry.setAttribute("class", ("pic "+ entradasJS[i]["type"]));

                var newEntryCard = document.createElement("a");
                newEntryCard.setAttribute("href", "./pet_Profile.php?id="+entradasJS[i]["id"]);

                var newImg = document.createElement("img");
                newImg.setAttribute("src", entradasJS[i]["img"]);

                /* appends */

                newEntryCard.appendChild(newImg);
                newEntry.appendChild(newEntryCard);

                document.getElementById("gallery").appendChild(newEntry); 
            }
        }
    
    })
    .fail(function(){
        console.log("error");
    })
    .always(function(){
        console.log("complete");
    });
});