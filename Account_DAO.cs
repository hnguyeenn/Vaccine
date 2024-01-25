using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QL_Vaccine.DAO
{
    public class Account_DAO
    {
        private static Account_DAO instance;

        public static Account_DAO Instance
        {
            get { if (instance == null) instance = new Account_DAO(); return instance; }
            private set { instance = value; }
        }

        private Account_DAO() { }

        public bool Login(string userName, string passWord)
        {
            string query = "[dbo].[USP_Login] @TenTK , @MatKhau ";
            DataTable result = DataProvider.Instance.ExecuteQuery(query, new object[] { userName, passWord });
            return result.Rows.Count > 0;
        }

        public string GetMaNVByTaiKhoan(string userName, string passWord)
        {
            string query = "Select MaNV from TaiKhoan where TenTK = '"+userName+"' AND MatKhau = '"+passWord+"'";
            return DataProvider.Instance.ExecuteScalar(query).ToString();
        }

        public bool CheckTK(string maNV)
        {
            string query = "Select * From TaiKhoan where MaNV ='"+maNV+"'";
            DataTable result = DataProvider.Instance.ExecuteQuery(query);
            return result.Rows.Count > 0;
        }
    }
}
