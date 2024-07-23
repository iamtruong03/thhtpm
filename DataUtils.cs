using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace Chua_Bai_TX2
{
    internal class DataUtils
    {
        static string filePath = "D:\\TichHopHeThong\\HT\\Chua_Bai_TX2\\DangKyLamThem.xml";
        static XmlDocument doc = new XmlDocument();
        static XmlElement root;

        public DataUtils()
        {
            doc.Load(filePath);
            root = doc.DocumentElement;
        }

        public void hienThiDGV(DataGridView dgv)
        {
            dgv.Rows.Clear();
            int index = 0;
            XmlNodeList ngayLamThems = doc.SelectNodes("/DangKyLamThem/NgayLamThem");
            foreach(XmlNode nlv in ngayLamThems)
            {
                XmlNodeList nhanViens = nlv.SelectNodes("NhanVien");
                foreach(XmlNode nv in nhanViens)
                {
                    dgv.Rows.Add();
                    dgv.Rows[index].Cells[0].Value = nlv.SelectSingleNode("@Ngay").InnerText;
                    dgv.Rows[index].Cells[1].Value = nv.SelectSingleNode("@Ma").InnerText;
                    dgv.Rows[index].Cells[2].Value = nv.SelectSingleNode("LoaiLamThem").InnerText;
                    dgv.Rows[index].Cells[3].Value = nv.SelectSingleNode("SoGio").InnerText;
                    dgv.Rows[index].Cells[4].Value = nv.SelectSingleNode("TrangThai").InnerText;
                    index++;
                }
            }
        }
        
        public bool kiemTraNhanVien(NhanVien x)
        {
            XmlNode ngayLamThem = doc.SelectSingleNode("/DangKyLamThem/NgayLamThem[@Ngay = '" + x.ngayLamThem + "']");
            if (ngayLamThem == null)
                return false;
            XmlNode ma = ngayLamThem.SelectSingleNode("NhanVien[@Ma='" + x.maNhanVien + "']");
            if (ma != null)
                return true;
            return false;
        }

        public bool them(NhanVien x)
        {
            if (kiemTraNhanVien(x))
            {
                MessageBox.Show("Thông tin đã tồn tại ạ!");
                return false;
            }
            XmlNode ngayLamThem = doc.SelectSingleNode("/DangKyLamThem/NgayLamThem[@Ngay = '" + x.ngayLamThem + "']");

            if(ngayLamThem != null)
            {
                XmlElement nhanVien = doc.CreateElement("NhanVien");

                XmlAttribute maNhanVien = doc.CreateAttribute("Ma");
                maNhanVien.InnerText = x.maNhanVien;
                nhanVien.Attributes.Append(maNhanVien);

                XmlElement loaiLamThem = doc.CreateElement("LoaiLamThem");
                loaiLamThem.InnerText = x.loaiLamThem;
                nhanVien.AppendChild(loaiLamThem);

                XmlElement soGio = doc.CreateElement("SoGio");
                soGio.InnerText = x.soGio + "";
                nhanVien.AppendChild(soGio);

                XmlElement trangThai = doc.CreateElement("TrangThai");
                trangThai.InnerText = x.trangThai;
                nhanVien.AppendChild(trangThai);

                ngayLamThem.AppendChild(nhanVien);
                doc.Save(filePath);
                return true;
            }
            XmlElement nlt = doc.CreateElement("NgayLamThem");
            
            XmlElement nv = doc.CreateElement("NhanVien");

            XmlAttribute ngay = doc.CreateAttribute("Ngay");
            ngay.InnerText = x.ngayLamThem;
            nlt.Attributes.Append(ngay);

            XmlAttribute ma = doc.CreateAttribute("Ma");
            ma.InnerText = x.maNhanVien;
            nv.Attributes.Append(ma);

            XmlElement llt = doc.CreateElement("LoaiLamThem");
            llt.InnerText = x.loaiLamThem;
            nv.AppendChild(llt);

            XmlElement sg = doc.CreateElement("SoGio");
            sg.InnerText = x.soGio + "";
            nv.AppendChild(sg);

            XmlElement tt = doc.CreateElement("TrangThai");
            tt.InnerText = x.trangThai;
            nv.AppendChild(tt);

            nlt.AppendChild(nv);
            root.AppendChild(nlt);
            doc.Save(filePath);
            return true;
        } 

        public bool xoa(NhanVien x)
        {
            XmlNode ngayLamThem = doc.SelectSingleNode("/DangKyLamThem/NgayLamThem[@Ngay = '" + x.ngayLamThem + "']");
            XmlNode nhanVien = ngayLamThem.SelectSingleNode("NhanVien[@Ma='" + x.maNhanVien + "']");
            if (nhanVien != null)
            {
                DialogResult rs = MessageBox.Show("Bạn có chăc chắn xóa không ạ!", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if(rs == DialogResult.Yes)
                {
                    ngayLamThem.RemoveChild(nhanVien);
                    doc.Save(filePath);
                    return true;
                }
            }
            return false;
        }

        public void tim(string ngay, DataGridView dgv)
        {
            XmlNode nlv = doc.SelectSingleNode("/DangKyLamThem/NgayLamThem[@Ngay = '" + ngay + "']");
            if(nlv != null)
            {
                int index = 0;
                XmlNodeList nhanViens = nlv.SelectNodes("NhanVien");
                dgv.Rows.Clear();
                foreach (XmlNode nv in nhanViens)
                {
                    dgv.Rows.Add();
                    dgv.Rows[index].Cells[0].Value = nlv.SelectSingleNode("@Ngay").InnerText;
                    dgv.Rows[index].Cells[1].Value = nv.SelectSingleNode("@Ma").InnerText;
                    dgv.Rows[index].Cells[2].Value = nv.SelectSingleNode("LoaiLamThem").InnerText;
                    dgv.Rows[index].Cells[3].Value = nv.SelectSingleNode("SoGio").InnerText;
                    dgv.Rows[index].Cells[4].Value = nv.SelectSingleNode("TrangThai").InnerText;
                    index++;
                }
                return;
            }
            MessageBox.Show("Ngay lam viec khong ton tai a!");
        }
    }
}
