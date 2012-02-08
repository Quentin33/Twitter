var io = require('socket.io').listen(1234);

var users_online = [];

io.sockets.on('connection', function (socket) {

      socket.on('notifierNouveauTweet', function (data) 
      {
	      socket.emit('notifieConnexion');
	      socket.broadcast.emit('notifierNouveauTweet', data);
      });

});

io.sockets.on('disconnect', function (socket) 
{    
	socket.emit('notifieDeconnexion');
});