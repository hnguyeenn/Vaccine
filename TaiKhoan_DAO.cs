using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class TaiKhoan_DAO
    {
        private static TaiKhoan_DAO instance;
        public static TaiKhoan_DAO Instance 
        {
            get { if (instance == null) instance = new TaiKhoan_DAO(); return instance; }
            private set { instance = value; }
        }

        private TaiKhoan_DAO() { }

        public bool InsertTaiKhoan(string maNV, string taiKhoan, string matKhau)
        {
            string query = "EXEC [dbo].[USP_InsertTaiKhoan] @MaNV = '" + maNV + "', @TenTK = '" + taiKhoan + "', @MatKhau = '" + matKhau + "'";
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}
