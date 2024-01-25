using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class NhanVien_DAO
    {
        private static NhanVien_DAO instance;

        public static NhanVien_DAO Instance
        {
            get { if (instance == null) instance = new NhanVien_DAO(); return instance; }
            private set { instance = value; }
        }

        private NhanVien_DAO() { }

        public List<NhanVien> GetNhanVienByMaNV(string maNV)
        {
            List<NhanVien> list = new List<NhanVien>();
            string query = "Select * from NhanVienYTe where MaNV = '" + maNV + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                NhanVien nhanVien = new NhanVien(item);
                list.Add(nhanVien);
            }
            return list;
        }

        public DataTable GetAllNhanVien()
        {
            string query = "Exec [dbo].[USP_AllNhanVien]";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable FindNhanVienByMaNV(string MaNV)
        {
            string query = "Exec [dbo].[USP_FindNhanVienByMaNV] @MaNV = '" + MaNV + "' ";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public string CountSoLuongNhanVien()
        {
            string query = "SELECT COUNT(MaNV) From NhanVienYTe";
            return DataProvider.Instance.ExecuteScalar(query).ToString();
        }

        public bool InsertNhanVien(string Ho, string TenDem, string Ten, string NgaySinh, int GioiTinh, string CCCD, string MaCV, string DiaChi, string DCCT, string SDT, string Email)
        {
            string query = "[dbo].[USP_InsertNhanVien] @Ho = N'"+Ho+"', @TenDem = N'"+TenDem+"', @Ten = N'"+Ten+"', @NgaySinh = '"+NgaySinh+"',@GioiTinh = "+GioiTinh+", @CCCD = '"+CCCD+"',@MaCV = '"+MaCV+"', @DiaChi = '"+DiaChi+"', @DCCT = N'"+DCCT+"',@SDT = '"+SDT+"', @Email = '"+Email+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdateNhanVien(string MaNV, string Ho, string TenDem, string Ten, string NgaySinh, int GioiTinh, string CCCD, string MaCV, string DiaChi, string DCCT, string SDT, string Email)
        {
            string query = "EXEC [dbo].[USP_UpdateNhanVien] @MaNV = '"+MaNV+"', @Ho = N'" + Ho + "', @TenDem = N'" + TenDem + "', @Ten = N'" + Ten + "', @NgaySinh = '" + NgaySinh + "',@GioiTinh = " + GioiTinh + ", @CCCD = '" + CCCD + "',@MaCV = '" + MaCV + "', @DiaChi = '" + DiaChi + "', @DCCT = N'" + DCCT + "',@SDT = '" + SDT + "', @Email = '" + Email + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteNhanVien(string MaNV)
        {
            string query = "EXEC [dbo].[USP_DeleteNhanVien] @MaNV = '"+MaNV+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<NhanVien> GetListNhanVien()
        {
            List<NhanVien> listNhanVien = new List<NhanVien>();
            string query = "SELECT * FROM NhanVienYTe";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                NhanVien nhanvien = new NhanVien(item);
                listNhanVien.Add(nhanvien);
            }
            return listNhanVien;
        }
    }
}
