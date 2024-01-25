using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class KhamSangLoc_DAO
    {
        private static KhamSangLoc_DAO instance;

        public static KhamSangLoc_DAO Instance 
        {
            get { if (instance == null) instance = new KhamSangLoc_DAO(); return KhamSangLoc_DAO.instance; }
            private set { KhamSangLoc_DAO.instance = value; }
        }

        private KhamSangLoc_DAO() { }

        public DataTable GetALLKhamSangLoc()
        {
            string query = "EXEC [dbo].[USP_GetKhamSangLocList]";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable FindKhamSangLocByMaKSL(string MaKSL)
        {
            string query = "Exec [dbo].[USP_FindKhamSangLocByMaKSL] @MaKSL = '" + MaKSL + "' ";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public string CountSoLuongPhieuKSL()
        {
            string query = "SELECT COUNT(MaKSL) From KhamSangLoc";
            return DataProvider.Instance.ExecuteScalar(query).ToString();
        }

        public bool InsertKhamSangLoc(string maKH, string maNV, string ngayKham, string nhipTim,string huyetAp, string chieuCao, string canNang, string thongTinKham, string thongTinKhac, int ketQua)
        {
            string query = "EXEC [dbo].[USP_InsertKhamSangLoc] @MaKH ='"+maKH+"',@MaNV = '"+maNV+"',@NgayKham = '"+ngayKham+"',@NhipTim = '"+nhipTim+"',@HuyetAp='"+huyetAp+"',@ChieuCao='"+chieuCao+"',@CanNang='"+canNang+"',@ThongTinKham=N'"+thongTinKham+"',@ThongTinKhac=N'"+thongTinKhac+"',@KetQua="+ketQua+"";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool DeleteKhamSangLoc(string MaKSL)
        {
            string query = "Delete KhamSangLoc Where MaKSL = '" + MaKSL + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public bool UpdateKhamSangLoc(string MaKSL, string maKH, string maNV, string nhipTim, string huyetAp, string chieuCao, string canNang, string thongTinKham, string thongTinKhac, int ketQua)
        {
            string query = "EXEC [dbo].[UpdateKhamSangLoc] @MaKSL = '"+MaKSL+"', @MaKH ='" + maKH + "',@MaNV = '" + maNV + "', @NhipTim = '" + nhipTim + "',@HuyetAp='" + huyetAp + "',@ChieuCao='" + chieuCao + "',@CanNang='" + canNang + "',@ThongTinKham=N'" + thongTinKham + "',@ThongTinKhac=N'" + thongTinKhac + "',@KetQua=" + ketQua + "";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }

        public List<KhamSangLoc> GetKhamSangLocByMaKSL(string maKSL)
        {
            List<KhamSangLoc> list = new List<KhamSangLoc>();
            string query = "Select * from KhamSangLoc where MaKSL = '" + maKSL + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                KhamSangLoc KhamSangLoc = new KhamSangLoc(item);
                list.Add(KhamSangLoc);
            }
            return list;
        }
    }
}
