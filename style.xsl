<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:dbk="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

<xsl:template match="dbk:article">
	<html lang="en"> <!-- TODO: from doc -->
		<head>
		  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		  <script src="hyphenate.js" type="text/javascript"></script>
		  
			<script type="text/javascript">
		    var disqus_shortname = 'eegg';
		
		    var disqus_identifier = 'page_margins';
		    var disqus_url = 'http://eegg.github.com/margins.xml';

		    (function() {
        		var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		    })();
			</script>

		  <title>eegg</title>
		  <link rel="stylesheet" type="text/css" href="main.css" />
		  <link rel="icon" type="image/png" href="favicon.png" />
		</head>
		<body class="hyphenate">
			<div class="header">
			    <div class="headerContents">
			    </div>
			</div>
			<div class="main">
				<xsl:apply-templates />
				<div id="disqus_thread"></div>
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template match="dbk:title">
	<h2><span class="outdentHeader"><xsl:number level="multiple" count="dbk:section" /></span><xsl:apply-templates /></h2>
</xsl:template>

<xsl:template match="dbk:blockquote">
	<blockquote>
        <xsl:apply-templates select="*[not(self::dbk:attribution)]" />
        <xsl:apply-templates select="dbk:attribution" />
	</blockquote>
</xsl:template>

<xsl:template match="dbk:attribution">
	<cite>
		<xsl:apply-templates />
	</cite>
</xsl:template>

<xsl:template match="dbk:para">
	<p>
		<xsl:apply-templates />
	</p>
</xsl:template>

<xsl:template match="dbk:section">
	<section>
		<xsl:apply-templates />
	</section>
</xsl:template>


<xsl:template match="dbk:acronym">
	<span class="acronym"><xsl:apply-templates /></span>
</xsl:template>

<xsl:template match="dbk:link">
	<a>
		<xsl:attribute name="href">
			<xsl:value-of select="@xlink:href" />
		</xsl:attribute>
		<xsl:apply-templates />
	</a>
</xsl:template>

<xsl:template match="dbk:sidebar">
	<div class="sidebar">
		<xsl:apply-templates />
	</div>
</xsl:template>

<xsl:template match="dbk:emphasis[@role='strong']"><strong><xsl:apply-templates /></strong></xsl:template>
<xsl:template match="dbk:emphasis"><em><xsl:apply-templates /></em></xsl:template>

<xsl:template match="dbk:itemizedlist"><ul><xsl:apply-templates /></ul></xsl:template>
<xsl:template match="dbk:listitem"><li><xsl:apply-templates /></li></xsl:template>
<xsl:template match="dbk:quote"><q><xsl:apply-templates /></q></xsl:template>

<xsl:template match="dbk:table"><table><xsl:apply-templates /></table></xsl:template>
<xsl:template match="dbk:thead"><thead><xsl:apply-templates /></thead></xsl:template>
<xsl:template match="dbk:tbody"><tbody><xsl:apply-templates /></tbody></xsl:template>
<xsl:template match="dbk:row"><tr><xsl:apply-templates /></tr></xsl:template>
<xsl:template match="dbk:entry"><td><xsl:apply-templates /></td></xsl:template>

<!-- fix hack -->
<xsl:template match="dbk:mediaobject">
	<figure>
		<xsl:apply-templates select="dbk:caption" />
		<xsl:apply-templates select="*[not(self::dbk:caption)]" />
	</figure>
</xsl:template>
<xsl:template match="dbk:caption">
	<div class="sidebar">
		<figcaption>
			<xsl:apply-templates />
		</figcaption>
	</div>
</xsl:template>
<xsl:template match="dbk:imagedata">
	<img>
		<xsl:attribute name="src">
			<xsl:value-of select="@fileref" />
		</xsl:attribute>
		<xsl:apply-templates />
	</img>
</xsl:template>

</xsl:stylesheet>
