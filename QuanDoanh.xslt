<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<!--Phương thức muốn chuyển về ngôn ngư nào-->
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
		<html>
			<body>
				<h2 align="center">Quân doanh</h2>
				<xsl:for-each select="/QuanDoanh/TieuDoi">
					Tên tiểu đội:<xsl:value-of select="Ten"/>
					<br/>
					Mã tiểu đội:<xsl:value-of select="@ma"/>
					<br/>
					Danh sách các chiến sĩ
					<table border="1">
						<tr bgcolor="blue">
							<td>Số thứ tự</td>
							<td>Tên</td>
							<td>Tuổi</td>
							<td>Ngày Nhập ngũ</td>
							<td>Tiểu sử</td>
							<td>Lương</td>
						</tr>
						<xsl:for-each select="ChienSi">
							<tr>
								<td>
									<!--position có chức năng là hiển thị vị trí hiện tại của nó-->
									<xsl:value-of select="position()"/>
								</td>
								<td>
									<xsl:value-of select="Ten"/>
								</td>
								<td>
									<xsl:value-of select="Tuoi"/>
								</td>
								<td>
									<xsl:value-of select="NgayNhapNgu"/>
								</td>
								<td>
									<xsl:value-of select="TieuSu"/>
								</td>
								<td>
									<xsl:value-of select="Luong"/>
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</xsl:for-each>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>
