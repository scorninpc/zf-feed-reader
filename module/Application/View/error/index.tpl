<h1>An error occurred</h1>
<h2>{$this->message}</h2>

{if (isset($this->display_exceptions) && $this->display_exceptions)}

	{if (isset($this->exception) && $this->exception instanceof Exception)}
	<hr/>
	<h2>Additional information</h2>
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
	    <dt>Stack trace:</dt>
	    <dd>
	        <pre class="prettyprint linenums">{$this->exception->getTraceAsString()}</pre>
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