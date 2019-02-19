$(document).ready(function(){
	var audio = [];
    
	window.addEventListener('message', function(event){
		const item = event.data;
		if (item.soundName) {
            const soundName = item.soundName;
            const args = item.soundArgs || [];

            if (audio[soundName]) {
                audio[soundName].pause();
                audio[soundName] = null;
            }

			var audioObject = new Audio("../audio/" + soundName + ".ogg");
			audioObject.volume = args.volume || 1.0;
            audioObject.loop = args.loop || 0;
            audioObject.play();
            audio[soundName] = audioObject;
		} else if (item.stopSound){
            if (item.soundName) {
                if (audio[soundName]) {
                    audio[soundName].pause();
                    audio[soundName] = null;
                }  
            } else {
                for (let elem in audio) audio[elem].pause();
                audio = [];
            }
		}
	});
});