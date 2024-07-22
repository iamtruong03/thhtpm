<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
	xmlns:x="http://tempuri.org/DanhSach.xsd"
>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				
			</head>
			<body>
				<h2  align="center">BANG LUONG THANG</h2>
				<xsl:for-each select="x:DS/x:CongTy">
					<h2>
						Ten cong ty: <xsl:value-of select="@TenCT"/>
					</h2>
					<xsl:for-each select="x:DonVi">
						<h2>
							Ten phong: <xsl:value-of select="x:TenDV"/>
						</h2>
					</xsl:for-each>
					<table border="1">
						<tr>
							<th>STT</th>
							<th>Ho ten</th>
							<th>Ngay sinh</th>
							<th>Ngay cong</th>
							<th>Luong</th>
						</tr>
						<xsl:for-each select="x:DonVi/x:NhanVien">
							<td>
								<xsl:value-of select="position()"/>
							</td>
							<td>
								<xsl:value-of select="x:HoTen"/>
							</td>
							<td>
								<xsl:value-of select="x:NgaySinh"/>
							</td>
							<td>
								<xsl:value-of select="x:NgayCong"/>
							</td>
							<td><xsl:value-of select="x:NgayCong*500"/>
							</td>
						</xsl:for-each>
					</table>
					<br>
						---------------------------------
					</br>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
