<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/page-title.xsl"/>
<xsl:import href="../utilities/navigation.xsl"/>
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/pagination.xsl"/>

<xsl:output method="html" omit-xml-declaration="yes" indent="no" />

<xsl:variable name="is-logged-in" select="/data/events/login-info/@logged-in"/>
<xsl:variable name="url-hero" />
<xsl:template match="/">
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>!DOCTYPE html<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<html lang="en">
		<head>
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
			<meta charset="utf-8" />
			<meta name="title" content="{$page-title}" />
			<meta name="description" content="" />
			<meta name="tags" content="" />
			<title><xsl:call-template name="page-title"/></title>

			<link rel="shortcut icon" href="/favicon.ico" />
			<link rel="icon" type="images/png" href="/favicon.png" />
			<link rel="stylesheet" media="screen" href="{$workspace}/css/adamlaycock.css" />
			
			<xsl:comment>[if !(IE)]<![CDATA[><!]]></xsl:comment>
				<link rel="stylesheet" media="screen" href="{$workspace}/css/webfonts/webfonts.css" />
			<xsl:comment><![CDATA[<!]]>[endif]</xsl:comment>	
					
			<xsl:comment><![CDATA[[if !IE]><link rel="stylesheet" media="screen" href="]]><xsl:value-of select="$root"/><![CDATA[/workspace/css/webfonts/webfonts.css" /><![endif]]]></xsl:comment>
			
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
			<script src="{$workspace}/js/master-ck.js"></script>

			<xsl:comment><![CDATA[[if lt IE 9]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/html5shiv.min.js"></script><![endif]]]></xsl:comment>
			<xsl:comment><![CDATA[[if (gte IE 6)&(lte IE 8)]><script type="text/javascript" src="]]><xsl:value-of select="$root"/><![CDATA[/workspace/js/selectivizr.min.js"></script><![endif]]]></xsl:comment>
		</head>
		<body id="{$current-page}-page" rel="{$current-page-id}">
			<div class="container">
				<header class="header row relative">
					<!-- navbar for phones only -->
					<div class="navbar navbar-fixed-top visible-phone">
					  <div class="navbar-inner">
					    <div class="container">
					      <button style="float:left;" type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					      	<h1>Menu</h1>
					      </button>
						  <h1 style="float:right;margin-right:15px;padding-top:2px;"><a href="{$root}?hero=0">Adam Laycock</a></h1>

					      <div class="nav-collapse collapse" style="height: 0px; ">
					        <xsl:apply-templates select="data/navigation"/>
					        <xsl:if test="$current-page-id = '1'">
					        	<ul class="homelinks">
					        		<li><a href="#" class="recentlyaddedlink">Recently added</a></li>
					        		<li><a href="#" class="categorieslink">Categories</a></li>
					        	</ul>
					        </xsl:if>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- end of phone navbar -->
				
					<div data-spy="affix" data-offset-top="0">
						<xsl:attribute name="class">
							<xsl:text>header-inner hidden-phone</xsl:text>
							<xsl:if test="$current-page-id = '1'">
								<xsl:text> whitebackground</xsl:text>
							</xsl:if>
						</xsl:attribute>
						<nav class="navigation span3">
							<xsl:apply-templates select="data/navigation"/>
						</nav>
						<div class="adamlaycock span3">
							<a href="{$root}?hero=0"><h1 class="adamlaycock">Adam Laycock</h1></a>
						</div>
						<div class="photoographer span3 offset3">
							<a href="{$root}?hero=0"><h1 class="photographer">Photographer</h1></a>
						</div>
						<xsl:if test="$current-page-id = '2'">
							<div style="position:absolute;border-top:1px solid #111;z-index:2;bottom:-2px;" class="span9 offset3"></div>
						</xsl:if>
						
						<xsl:if test="$current-page-id = '1' and /data/hero/entry/on='Yes' and $url-hero != '0'">
							<div class="extralines">
								<div style="position:absolute;border-top:1px solid #111; bottom:-2px;left:0;" class="span12"></div>
							</div>
						</xsl:if>
						
					</div> <!-- end .header-inner -->
				</header>

				<div class="maincontent" id="content" rel="{$url-hero}">
					<xsl:apply-templates />
				</div> <!-- end .maincontent -->

				<footer class="footer">
					<!-- analytics -->				
				</footer>
			</div> <!-- end .container -->
		</body>
	</html>
</xsl:template>

<xsl:strip-space elements="*"/>

</xsl:stylesheet>