using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class KhachHang_DAO
    {
        private static KhachHang_DAO instance;

        public static KhachHang_DAO Instance 
        {
            get { if (instance == null) instance = new KhachHang_DAO(); return instance; }
            private set { instance = value; }
        }

        private KhachHang_DAO() { }

        public DataTable GetAllKhachHang()
        {
            string query = "EXEC [dbo].[USP_GetKhachHangList]";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable FindKhachHangByMaKH(string MaKH)
        {
            string query = "Exec [dbo].[USP_FindKhachHangByMaKH] @MaKH = '"+MaKH+"'";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public string CountSoLuongKhachHang()
        {
            string query = "SELECT COUNT(MaKH) From KhachHang";
            return DataProvider.Instance.ExecuteScalar(query).ToString();
        }

        public bool InsertKhachHang(string Ho, string TenDem, string Ten, string NgaySinh, int GioiTinh, string Ho_NGH, string TenDem_NGH, string Ten_NGH, string CCCD, string BHYT, string DiaChi, string DCCT, string SDT, string Email, string HoTenNVNhap)
        {
            string query = "Exec [dbo].[USP_InsertKhachHang]  @Ho = N'"+Ho+"', @Tendem = N'"+TenDem+"', @Ten = N'"+Ten+"', @NgaySinh = '"+NgaySinh+"', @GioiTinh = "+GioiTinh+", @Ho_NGH = N'"+Ho_NGH+"', @TenDem_NGH = N'"+TenDem_NGH+"', @Ten_NGH = N'"+Ten_NGH+"', @CCCD = '"+CCCD+"',@MaBHYT = '"+BHYT+"',@DiaChi = '"+DiaChi+"',@DCCT = N'"+DCCT+"', @SDT = '"+SDT+"', @Email = '"+Email+"',@HoTen_NV = N'"+HoTenNVNhap+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<KhachHang> GetKhachHangByMaKH(string maKH)
        {
            List<KhachHang> list = new List<KhachHang>();
            string query = "Select * from KhachHang where MaKH = '" + maKH + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                KhachHang KhachHang = new KhachHang(item);
                list.Add(KhachHang);
            }
            return list;
        }

        public bool UpdateKhachHang(string MaKH,string Ho, string TenDem, string Ten, string NgaySinh, int GioiTinh, string Ho_NGH, string TenDem_NGH, string Ten_NGH, string CCCD, string BHYT, string DiaChi, string DCCT, string SDT, string Email, string HoTenNVNhap)
        {
            string query = "Exec [dbo].[USP_UpdateKhachHang] @MaKH = '"+MaKH+"',  @Ho = N'" + Ho + "', @Tendem = N'" + TenDem + "', @Ten = N'" + Ten + "', @NgaySinh = '" + NgaySinh + "', @GioiTinh = " + GioiTinh + ", @Ho_NGH = N'" + Ho_NGH + "', @TenDem_NGH = N'" + TenDem_NGH + "', @Ten_NGH = N'" + Ten_NGH + "', @CCCD = '" + CCCD + "',@MaBHYT = '" + BHYT + "',@DiaChi = '" + DiaChi + "',@DCCT = N'" + DCCT + "', @SDT = '" + SDT + "', @Email = '" + Email + "',@HoTen_NV = N'" + HoTenNVNhap + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteKhachHang(string MaKH)
        {
            string query = "EXEC [dbo].[USP_DeleteKhachHang] @MaKH = '"+MaKH+"'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

    }
}
