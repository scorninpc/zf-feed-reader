{$this->doctype()}
<html lang="pt-BR" prefix="fb: http://ogp.me/ns/fb# og: http://ogp.me/ns#" >
	<head>
		<meta charset="utf-8">
		{$this->headTitle()}
		
		<!--[if lt IE 9]>
		<script src="{$this->basePath()}/js/html5shiv.js"></script>
		<![endif]-->
		
		{$this->headMeta()}
		
		{* <link href="{$this->basePath()}/images/favicon.ico" rel="shortcut icon" type="images/vnd.microsoft.icon"> *}
		<link href="{$this->basePath()}/css/style.css" media="screen" rel="stylesheet" type="text/css">
		
		{* Inclui os CSS por pagina *}
		{if $_currentController == "Application\Controller\Index" && $_currentAction == "index"}
		<link href="{$this->basePath()}/css/index/index.css" media="screen" rel="stylesheet" type="text/css">
		{/if}
		
		<script type="text/javascript">var Prime = {literal}{{/literal}basePath:'{$this->basePath()}'{literal}}{/literal};</script>
	</head>
	<body>
		
		<div class="all-site">
			{$this->content}
		</div>
		
		<script type="text/javascript" src="{$this->basePath()}/js/jquery-1.10.1.min.js"></script>
		<script type="text/javascript" src="{$this->basePath()}/js/global.js"></script>
		<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEue4kmz38Yk-crTMOHd4zcnSt8yhoFG4&amp;sensor=false"></script>
		
		{* Inclui os JS por pagina *}
		{if $_currentController == "Application\Controller\Index" && $_currentAction == "index"}
		<script type="text/javascript" src="{$this->basePath()}/js/index/index.js"></script>
		{/if}
		
	</body>
</html>
