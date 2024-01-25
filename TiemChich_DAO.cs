using QL_Vaccine.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class TiemChich_DAO
    {
        private static TiemChich_DAO instance;

        public static TiemChich_DAO Instance
        {
            get { if (instance == null) instance = new TiemChich_DAO(); return TiemChich_DAO.instance; }
            private set { TiemChich_DAO.instance = value; }
        }

        private TiemChich_DAO() { }

        public DataTable GetALLTiemChich()
        {
            string query = "Exec [dbo].[USP_GetTiemChichList]";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public DataTable FindPhieuTiemByMaKH(string MaKH)
        {
            string query = "EXEC [dbo].[USP_FindTiemChichByMaKH] @MaKH = '"+MaKH+"'";
            return DataProvider.Instance.ExecuteQuery(query);
        }

        public bool InsertPhieuTiem(string maNV, string maKH, string maVacxin, string maSoLo, int tiemLan, string ngayTiem, float lieuLuong, string duongvaViTriTiem, string ghiChu)
        {
            int result = DataProvider.Instance.ExecuteNonQuery("EXEC [dbo].[USP_AddTiemChich_UpdateLoVacxin]  @MaNV , @MaKH , @MaVacxin , @MaSoLo , @TiemLan , @NgayTiem , @GhiChu , @LieuLuong , @DuongvaViTriTiem ", new object[] { maNV, maKH, maVacxin, maSoLo, tiemLan, ngayTiem, ghiChu, lieuLuong, duongvaViTriTiem });
            return result > 0;
        }

        public bool UpdatePhieuTiem(string maTiem, string maNV, string maKH, string maVacxin, string maSoLo, int tiemLan, string ngayTiem, string ghiChu, float lieuLuong, string duongvaViTriTiem)
        {
            int result = DataProvider.Instance.ExecuteNonQuery( "EXEC USP_UpdateTiemChich @MaTiem , @MaNV , @MaKH , @MaVacxin , @MaSoLo , @TiemLan , @NgayTiem , @GhiChu , @LieuLuong , @DuongvaViTriTiem ",new object[] {maTiem, maNV, maKH, maVacxin, maSoLo, tiemLan, ngayTiem, ghiChu, lieuLuong, duongvaViTriTiem });
            return result > 0;
        }

        public List<TiemChich> GetTiemChichByMaTiem(string maTiem)
        {
            List<TiemChich> list = new List<TiemChich>();
            string query = "Select * from TiemChich where MaTiem = '" + maTiem + "'";
            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                TiemChich tiemChich = new TiemChich(item);
                list.Add(tiemChich);
            }
            return list;
        }
    }
}
