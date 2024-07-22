<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<body>
				<h2 align="center">
					Du bao thoi tiet
				</h2>
				<xsl:for-each select="/DuBaoThoiTiet/ThoiTiet">
					Ngày:<xsl:value-of select="@ngay"/>
					<br/>
					<table border="1">
						<tr bgcolor="green">
							<td>STT</td>
							<td>Khu vuc</td>
							<td>Kiểu thời tiết</td>
							<td>Nhiệt đọ cao nhăt</td>
							<td>Nhiệt độ thấp nhất</td>
						</tr>
						<xsl:for-each select="KhuVuc">
							<tr>
								<td>
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:value-of select="@ma"/>
								</td>
								<td>
									<xsl:choose>
										<xsl:when test="KieuThoiTiet ='May'">
											<img alt="anh may" src="img/may.jpg"/>
										</xsl:when>
										<xsl:when test="KieuThoiTiet ='Nang'">
											<img alt="anh nang" src="img/nang.jpg"/>
										</xsl:when>
										<xsl:otherwise>
											<img alt="anh mua" src="img/mua.jpg"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
								<td>
									<xsl:value-of select="NhietDoCaoNhat"/>
								</td>
								<td>
									<xsl:value-of select="NhietDoThapNhat"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:for-each>
				
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
