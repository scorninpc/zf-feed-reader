{if $this->display_exceptions}
	<h1>A 404 error occurred</h1>
	
	<h2>{$this->message}</h2>
	
	{if (isset($this->reason) && $this->reason)}
		{if $this->reason == "error-controller-cannot-dispatch"}
			<p>The requested controller was unable to dispatch the request.</p>
		{elseif $this->reason == "error-controller-not-found"}
			<p>The requested controller could not be mapped to an existing controller class.</p>
		{elseif $this->reason == "error-controller-invalid"}
			<p>The requested controller was not dispatchable.</p>
		{elseif $this->reason == "error-router-no-match"}
			<p>The requested URL could not be matched by routing.</p>
		{else}
			<p>We cannot determine at this time why a 404 was generated.</p>
		{/if}
	{/if}
	
	{if (isset($this->controller) && $this->controller)}
		<dl>
		    <dt>Controller:</dt>
		    <dd>{$this->escapeHtml($this->controller)}{if (isset($this->controller_class) && $this->controller_class && $this->controller_class != $this->controller)} (resolves to {$this->escapeHtml($this->controller_class)}) {/if} </dd>
		</dl>
	{/if}
	
	{if (isset($this->display_exceptions) && $this->display_exceptions)}
	
	{if (isset($this->exception) && $this->exception instanceof Exception)}
	<hr/>
	<h2>Additional information:</h2>
	<h3>{get_class($this->exception)}</h3>
	<dl>
	    <dt>File:</dt>
	    <dd>
	        <pre class="prettyprint linenums">{$this->exception->getFile()}:{$this->exception->getLine()}</pre>
	    </dd>
	    <dt>Message:</dt>
	    <dd>
	        <pre class="prettyprint linenums">{$this->exception->getMessage()}</pre>
	    </dd>
	    <dt><?php echo $this->translate('Stack trace') ?>:</dt>
	    <dd>
	        <pre class="prettyprint linenums"><?php echo $this->exception->getTraceAsString() ?></pre>
	    </dd>
	</dl>
	{if $this->exception->getPrevious()}
	<hr/>
	<h2>Previous exceptions:</h2>
	<ul class="unstyled">
	    {while $e}
	    	<li>
		        <h3>{get_class($e)}</h3>
		        <dl>
		            <dt>File:</dt>
		            <dd>
		                <pre class="prettyprint linenums">{$e->getFile()}:{$e->getLine()}</pre>
		            </dd>
		            <dt>Message:</dt>
		            <dd>
		                <pre class="prettyprint linenums">{$e->getMessage()}</pre>
		            </dd>
		            <dt>Stack trace:</dt>
		            <dd>
		                <pre class="prettyprint linenums">{$e->getTraceAsString()}</pre>
		            </dd>
		        </dl>
		    </li>
	    	{assign var=e value=$e->getPrevious()}
		{/while}
	</ul>
	{/if}
	
	{else}
	
	<h3>No Exception available</h3>
	
	{/if}
	
	{/if}
{else}
	<html lang="pt-BR">
		<head>
			<meta charset="utf-8">
			<title>Prime Seven - Web Solutions</title>
			
			<!--[if lt IE 9]>
			<script src="{$this->basePath()}/js/html5shiv.js"></script>
			<![endif]-->
		
			<meta name="Author" content="Prime Seven - Web Solutions">
			<meta name="robots" content="noindex, follow">
			<meta name="googlebot" content="noindex, follow">
			
			<link href="{$this->basePath()}/images/favicon.ico" rel="shortcut icon" type="images/vnd.microsoft.icon">
			<link href="{$this->basePath()}/css/style.css" media="screen" rel="stylesheet" type="text/css">
			
			<script type="text/javascript" src="{$this->basePath()}/js/jquery-1.9.1.min.js"></script>
			<script type="text/javascript">
				var Prime = {literal}{{/literal}basePath:'{$this->basePath()}'{literal}}{/literal};
				
				{literal}
				var __99skk2k88s = function () { setTimeout(function() { var h1 = $('<h1 class="site-logo"><a href="'+Prime.basePath+'/inicial" title="Prime Seven - Web Solutions"><img src="'+Prime.basePath+'/images/logo-primeseven.png" width="95" height="61" alt="Prime Seven - Web Solutions"></a><div class="as99s8dk">A página requisitada não foi encontrada <strong>Prime Seven - Web Solutions</strong><span><b>:</b>//</span><a href="'+Prime.basePath+'/inicial" class="back">voltar para página inicial</div></h1>'); h1.css({ 'position' : 'absolute', 'top' : -126, 'left' : '50%', 'margin-left' : -126, 'z-index':'90001' }); $('body').append(h1); h1.animate({ 'top' : 0 }, 500, function() { h1.find('span').delay(1000).animate({ 'opacity' : 1 }, function() { h1.find('.back').delay(1000).animate({'opacity':1}); }); }); }, 1000); };
				$(function() {
					__99skk2k88s();
				});
				{/literal}
			</script>
			
			<style>
				.as99s8dk { text-transform: lowercase; width: 270px; margin-left: -135px; margin-top: 40px; text-align: center; } .as99s8dk span { margin-left: 50px; display: block; font-size: 150px; color: #d7df23; font-family: Arial; margin-top: 20px; opacity: 0; } .as99s8dk span b { margin-top: -11px; position: absolute; margin-left: -40px; font-size: 100px; } .as99s8dk strong { font-size: 20px; font-weight: bold; margin-top: 5px; display: block; text-transform: lowercase; } .back { top: 270px !important; font-size: 60px !important; left: -185px !important; text-transform: lowercase !important; color: #d7df23 !important; width: 390px !important; opacity: 0; }
			</style>
		</head>
	<body>
	</body>
</html>
{/if}
