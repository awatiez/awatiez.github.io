<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:html="http://www.w3.org/1999/xhtml"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="html">
	
	<xsl:param name="lang"></xsl:param>
	<xsl:param name="title"></xsl:param>
	
	<xsl:template match = "/">
		<xsl:apply-templates select="curriculum"/>
	</xsl:template>
	
	<xsl:template match="curriculum">
        <html>
            <head>
                <title><xsl:value-of select="title"/></title>
				<meta charset="UTF-8"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>
				<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
				<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'/>
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
				<style>
				html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
				</style>
            </head>
            <body class="w3-light-grey">
				<!-- Page Container -->
				<div class="w3-content w3-margin-top" style="max-width:1400px;">

					<!-- The Grid -->
					<div class="w3-row-padding">
						<!-- Left Column -->
						<div class="w3-third">
							<xsl:apply-templates select="person"/>
						  
						<!-- End Left Column -->
						</div>
						
						<!-- Right Column -->
						<div class="w3-twothird">
							<xsl:apply-templates select="steps"/>
							<xsl:apply-templates select="tasks"/>

						<!-- End Right Column -->
						</div>
	
					<!-- End Grid -->					
					</div>
					
				<!-- End Page Container -->
				</div>
				  
				<footer class="w3-container w3-teal w3-center w3-margin-top">
					<br/>
					<p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
				</footer>
            </body>
        </html>
    </xsl:template>
	
	<xsl:template match="title">
        <h1>
			<xsl:value-of select="."/>
        </h1>
        <hr/>
    </xsl:template>
	
	<xsl:template match="person">
        <div class="w3-white w3-text-grey w3-card-4">

			<div class="w3-display-container">
				<img src="{@image}" style="width:100%" alt="Avatar"/>
				<div class="w3-display-bottomleft w3-container w3-text-white">
					<h2><xsl:value-of select="name"/></h2>
				</div>
			</div>
			<div class="w3-container">
				<p>
					<i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"><span style="visibility:hidden">invisible</span></i>
					<xsl:value-of select="status"/>
				</p>
				<p>
					<i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"><span style="visibility:hidden">invisible</span></i>
					<xsl:for-each select="address/.">
						<xsl:value-of select="."/>
					</xsl:for-each>
				</p>
				<p>
					<i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"><span style="visibility:hidden">invisible</span></i>
					<xsl:value-of select="email"/>
				</p>
				<p>
					<i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"><span style="visibility:hidden">invisible</span></i>
					<xsl:value-of select="phone"/>
				</p>
			  <hr/>
			<xsl:apply-templates select="/curriculum/skills"/>
			
			</div>
		  </div><br/>
    </xsl:template>
	
	<xsl:template match="skills">
		<xsl:choose>
			<xsl:when test="title='Skills' or title='Compétences en TAL'">
				<p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal">
					<span style="visibility:hidden">invisible</span></i><xsl:value-of select="title"/></b>
				</p>
				<ul class="w3-ul">
				<xsl:for-each select="skill">
					<li><xsl:value-of select="."/></li>
				</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<p class="w3-large"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal">
					<span style="visibility:hidden">invisible</span></i><xsl:value-of select="title"/></b>
				</p>
				<xsl:for-each select="skill">
					<p><xsl:value-of select="."/></p>
					<div class="w3-light-grey w3-round-xlarge w3-small">
						<xsl:variable name="level"><xsl:value-of select="./@profiles"/></xsl:variable>
						<div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:{$level}%"><span style="visibility:hidden">invisible</span></div>
					</div>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		
		<br/>
	</xsl:template>
	
	<xsl:template match="steps">
		<div class="w3-container w3-card w3-white w3-margin-bottom">
			<xsl:choose>
				<xsl:when test="title='Education' or title='Formation'">
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fa fa-graduation-cap fa-fw w3-margin-right w3-xxlarge w3-text-teal"><span style="visibility:hidden">invisible</span></i>
						<xsl:value-of select="title"/>
					</h2>
				</xsl:when>
				<xsl:otherwise>
					<h2 class="w3-text-grey w3-padding-16">
						<i class="fa fa-briefcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"><span style="visibility:hidden">invisible</span></i>
						<xsl:value-of select="title"/>
					</h2>
				</xsl:otherwise>
			</xsl:choose>
		
			<xsl:for-each select="step">
				<div class="w3-container">
					<h5 class="w3-opacity"><b><xsl:value-of select="./org/contract"/></b></h5>
					<h6>
						<span class="w3-text-teal">
							<i class="fa fa-calendar fa-fw w3-margin-right"><span style="visibility:hidden">invisible</span></i>
							<xsl:choose>
								<xsl:when test="$lang= 'fra'">
									<xsl:variable name="start"><xsl:value-of select="./@start"/></xsl:variable>
									<xsl:choose>
										<xsl:when test="../title[text()!='Education' and text() !='Formation']">
											<xsl:value-of select ="concat(substring($start,9,2),'/',substring($start,6,2),'/',substring($start,1,4))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select ="substring($start,1,4)" />
										</xsl:otherwise>
									</xsl:choose>
									<span> --> </span>
									
									<xsl:variable name="end"><xsl:value-of select="./@end"/></xsl:variable>
									<xsl:choose>
									<xsl:when test="$end= ''">
										<span class="w3-tag w3-teal w3-round">Aujourd'hui</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
										<xsl:when test="../title[text()!='Education' and text() !='Formation']">
											<xsl:value-of select ="concat(substring($end,9,2),'/',substring($end,6,2),'/',substring($end,1,4))" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select ="substring($end,1,4)" />
										</xsl:otherwise>
										</xsl:choose>
									</xsl:otherwise>
									</xsl:choose>
									
								</xsl:when>
								<xsl:otherwise>
									<xsl:variable name="start"><xsl:value-of select="./@start"/></xsl:variable>
									<xsl:choose>
										<xsl:when test="../title[text()!='Education' and text() !='Formation']">
											<xsl:value-of select ="$start" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select ="substring($start,1,4)" />
										</xsl:otherwise>
									</xsl:choose>
									<span> --> </span>
									
									<xsl:variable name="end"><xsl:value-of select="./@end"/></xsl:variable>
									<xsl:choose>
									<xsl:when test="$end= ''">
										<span class="w3-tag w3-teal w3-round">Today</span>
									</xsl:when>
									<xsl:otherwise>
										<xsl:choose>
										<xsl:when test="../title[text()!='Education' and text() !='Formation']">
											<xsl:value-of select ="$end" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select ="substring($end,1,4)" />
										</xsl:otherwise>
									</xsl:choose>
									</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
							
							
						</span>
						<span class="w3-text-grey">
							<i class="fa fa-users fa-fw w3-margin-left"><span style="visibility:hidden">invisible</span></i>
							<xsl:value-of select="./org/name"/>
						</span>
						<span class="w3-text-grey">
							<i class="fa fa-map-pin fa-fw w3-margin-left"><span style="visibility:hidden">invisible</span></i>
							<xsl:value-of select="./org/address/city"/>, <xsl:value-of select="./org/address/country"/>
						</span>
					</h6>
					<xsl:apply-templates select="./tasks"/>
					
					<hr/>
				</div>
			</xsl:for-each>
		</div>
		
		<br/>
	</xsl:template>
	
	<xsl:template match="tasks">
		<p><xsl:value-of select="./summary"/></p>
			
		<xsl:for-each select="task">
			<i class="fa fa-cubes fa-fw w3-margin-left"><span style="visibility:hidden">invisible</span></i>
			<span style="visibility:hidden">ii</span>
			<xsl:value-of select="./key"/>
			<xsl:for-each select="skill">
				<div class="w3-text-grey w3-margin-left">
					<i class="fa fa-certificate fa-fw w3-margin-left"><span style="visibility:hidden">invisible</span></i>
					<xsl:value-of select="."/>
				</div>
			</xsl:for-each>
			<br/>
		</xsl:for-each>
	</xsl:template>
	
</xsl:transform>

