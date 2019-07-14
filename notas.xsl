<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
	<xsl:template match="text()" priority="-1"/>
	<xsl:template match="/nfeProc">
	
		<html>
			<head>
				<title>
					<xsl:value-of select="titulo"/>
				</title>
			</head>
			<body>
				<xsl:for-each select="//emit">
					<br/>
					<xsl:value-of select="xNome"/>
					<br/>
					<xsl:value-of select="xFant"/>
					<p/>
				</xsl:for-each>
				<xsl:for-each select="//dest">
					<br/>
					<xsl:value-of select="xNome"/>
					<br/>
					<xsl:value-of select="email"/>
					<p/>
				</xsl:for-each>
				<xsl:for-each select="//total">
					<br/>
					<xsl:value-of select="vNF"/>
					<p/>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>