
$(function() {
	// Verifica o navegador
	options = {
		reject : {
			msie5: true, msie6: true, msie7: true, msie8: true,
			firefox1: true, firefox2: true,
			konqueror: true,
			chrome1: true, chrome2: true, chrome3: true,
			safari1: true, safari2: true, safari3: true,
			opera7: true, opera8: true, opera9: true
		},
		display: [],
		browserShow: true,
		browserInfo: {
			firefox: {
				text: 'Firefox',
				url: 'http://www.mozilla.com/firefox/'
			},
			safari: {
				text: 'Safari',
				url: 'http://www.apple.com/safari/download/'
			},
			opera: {
				text: 'Opera',
				url: 'http://www.opera.com/download/'
			},
			chrome: {
				text: 'Chrome',
				url: 'http://www.google.com/chrome/'
			},
			msie: {
				text: 'Internet Explorer',
				url: 'http://www.microsoft.com/windows/Internet-explorer/'
			},
			gcf: {
				text: 'Google Chrome Frame',
				url: 'http://code.google.com/chrome/chromeframe/',
				allow: { all: false, msie: true }
			}
		},

		header: 'Quer Evoluir?',
		paragraph1: 'Você sabia que seu navegador esta desatualizado?',
		paragraph2: 'Com este navegador você não poderá usufruir e visualizar todos os efeitos e funcionalidades deste site! Sugerimos que instale um dos navegadores clicando nos ícones abaixo:',
		close: true,
		closeMessage: 'Você pode ignorar esta mensagem, porém não podemos garantir uma boa experiencia!',
		closeLink: 'Sim quero fechar!',
		closeURL: '#',
		closeESC: false,
		
		more: true,
		moreMessage: 'Quer saber porque é legal evoluir e manter o navegador atualizado?<br><a href="http://primeseven.com.br/atualize-seu-navegador" rel="external">Clique aqui a <strong>Prime Seven</strong> explica para você!</a>',
	

		closeCookie: true,
		cookieSettings: {
			path: '/',
			expires: 0
		},

		imagePath: Prime.basePath + '/images/reject/',
		overlayBgColor: '#000',
		overlayOpacity: 0.8,

		fadeInTime: 'fast',
		fadeOutTime: 'fast'
	};
	$.reject(options);
	
	// Adiciona o target blank
	$('a[rel="external"]').attr('target', '_blank');
});