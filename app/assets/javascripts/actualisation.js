$(document).ready(function() 
{
    var socket = io.connect('http://localhost:1234');
    var numberNewTweets = new Array();

    socket.on('notifieConnexion', function()
    {
    });

    socket.on('notifieDeconnexion', function()
    {
    });

    socket.on('notifierNouveauTweet', function(data)
    {
          add_new_tweet(data);
    });


    function add_new_tweet(tweet)
    {
        //On ajoute le tweet au tableau 
        numberNewTweets.push(tweet);

        //On affiche un message en fonction du nombre de nouveaux tweets
        if(numberNewTweets.length == 1)
        {
            $('#nouveaux_tweets').html("<div class='alert-message info' style='text-align:center;'><a href='/' style='color:#FFFFFF;'>Il y a de nouveaux twits</a></div>");    
        }

    }

    function send_tweet(tweet, token)
    {
        $.post('http://localhost:3000/posts',
            {twit: tweet, authenticity_token: token},
        function(data) 
        {
            $('#message').val('');
            socket.emit('notifierNouveauTweet', data);
        })
    }

    //Fonction qui envoi un tweet avec jQuery
    $('#btnEnvoiTweet').click(function() 
    {
        send_tweet($('#message').val(), $('meta[name=csrf-token]').attr('content'));
        $('#nouveaux_tweets').html("<p><b><span class='label notice'>Créé il y a moins d'une minute</span> &nbsp; <a href='/users/tweet/" + $("#DivCurrentUser").html() + "'><span class='label success'>par " + $("#DivCurrentUser").html() + "</span></a> </b> </p>  <p><div class='alert-message block-message info'>" + $('#message').val() + "</div> </p>");
        return false;
    });
});