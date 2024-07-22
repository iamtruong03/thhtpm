<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:x ="http://tempuri.org/ChamCong.xsd"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<body>
				<h1 align="center">Bảng chấm công</h1>
				<xsl:for-each select="/x:ChamCong/x:NgayLamViec">
					<table border="1">
						<tr bgcolor="green">
							<th>STT</th>
							<th>Ma NV</th>
							<th>Ca lam viec</th>
							<th>Gio ra</th>
							<th>Gio Vao</th>
							<th>Lam dem</th>
						</tr>
						<xsl:for-each select="x:NhanVien">
							<tr>
								<td>
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:value-of select="@MaNV"/>
								</td>
								<td>
									<xsl:value-of select="x:CaLamViec"/>
								</td>
								<td>
									<xsl:value-of select="x:GioVao"/>
								</td>
								<td>
									<xsl:value-of select="x:GioRa"/>
								</td>
								<td align="center">
									<xsl:choose>
										<xsl:when test="x:CaLamViec = 'C3'">
											x
										</xsl:when>
									</xsl:choose>
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<h3>Ngày làm việc:  <xsl:value-of select="@Ngay"/>
				</h3>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
