using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace TLLib
{
    public class DatLichKham
    {
        string connectionString = Common.ConnectionString;
        DBNull dbNULL = DBNull.Value;

        //public string DatLichKhamInsert(
        //    string DatLichCho,
        //    string HoTen,
        //    string NgaySinh,
        //    string GioiTinh,
        //    string DienThoai,
        //    string Email,
        //    string ProjectCategoryID,
        //    string ProjectID,
        //    string MoTa,
        //    string NgayKham,
        //    string GioKham,
        //    string IsAvailable,
        //    string Priority
        //)
        //{
        //    try
        //    {
        //        var scon = new SqlConnection(connectionString);
        //        var cmd = new SqlCommand("usp_DatLichKham_Insert", scon);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.Parameters.AddWithValue("@DatLichCho", string.IsNullOrEmpty(DatLichCho) ? dbNULL : (object)DatLichCho);
        //        cmd.Parameters.AddWithValue("@HoTen", string.IsNullOrEmpty(HoTen) ? dbNULL : (object)HoTen);
        //        cmd.Parameters.AddWithValue("@NgaySinh", string.IsNullOrEmpty(NgaySinh) ? dbNULL : (object)NgaySinh);
        //        cmd.Parameters.AddWithValue("@GioiTinh", string.IsNullOrEmpty(GioiTinh) ? dbNULL : (object)GioiTinh);
        //        cmd.Parameters.AddWithValue("@DienThoai", string.IsNullOrEmpty(DienThoai) ? dbNULL : (object)DienThoai);
        //        cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
        //        cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
        //        cmd.Parameters.AddWithValue("@ProjectID", string.IsNullOrEmpty(ProjectID) ? dbNULL : (object)ProjectID);
        //        cmd.Parameters.AddWithValue("@MoTa", string.IsNullOrEmpty(MoTa) ? dbNULL : (object)MoTa);
        //        cmd.Parameters.AddWithValue("@NgayKham", string.IsNullOrEmpty(NgayKham) ? dbNULL : (object)NgayKham);
        //        cmd.Parameters.AddWithValue("@GioKham", string.IsNullOrEmpty(GioKham) ? dbNULL : (object)GioKham);
        //        cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
        //        cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

        //        SqlParameter imageNameParam = new SqlParameter("@OutImageName", null);
        //        SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
        //        imageNameParam.Size = 100;
        //        errorCodeParam.Size = 4;
        //        errorCodeParam.Direction = imageNameParam.Direction = ParameterDirection.Output;
        //        cmd.Parameters.Add(imageNameParam);
        //        cmd.Parameters.Add(errorCodeParam);
        //        scon.Open();
        //        cmd.ExecuteNonQuery();
        //        scon.Close();

        //        if (errorCodeParam.Value.ToString() != "0")
        //            throw new Exception("Stored Procedure 'usp_DatLichKham_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

        //        return imageNameParam.Value.ToString();
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}

        public int DatLichKhamInsert(
            string DatLichCho,
            string HoTen,
            string NgaySinh,
            string GioiTinh,
            string DienThoai,
            string Email,
            string ProjectCategoryID,
            string ProjectID,
            string MoTa,
            string NgayKham,
            string GioKham,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_Insert", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DatLichCho", string.IsNullOrEmpty(DatLichCho) ? dbNULL : (object)DatLichCho);
                cmd.Parameters.AddWithValue("@HoTen", string.IsNullOrEmpty(HoTen) ? dbNULL : (object)HoTen);
                cmd.Parameters.AddWithValue("@NgaySinh", string.IsNullOrEmpty(NgaySinh) ? dbNULL : (object)NgaySinh);
                cmd.Parameters.AddWithValue("@GioiTinh", string.IsNullOrEmpty(GioiTinh) ? dbNULL : (object)GioiTinh);
                cmd.Parameters.AddWithValue("@DienThoai", string.IsNullOrEmpty(DienThoai) ? dbNULL : (object)DienThoai);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@ProjectID", string.IsNullOrEmpty(ProjectID) ? dbNULL : (object)ProjectID);
                cmd.Parameters.AddWithValue("@MoTa", string.IsNullOrEmpty(MoTa) ? dbNULL : (object)MoTa);
                cmd.Parameters.AddWithValue("@NgayKham", string.IsNullOrEmpty(NgayKham) ? dbNULL : (object)NgayKham);
                cmd.Parameters.AddWithValue("@GioKham", string.IsNullOrEmpty(GioKham) ? dbNULL : (object)GioKham);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_Insert' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int DatLichKhamUpdate(
            string DatLichKhamID,
            string DatLichCho,
            string HoTen,
            string NgaySinh,
            string GioiTinh,
            string DienThoai,
            string Email,
            string ProjectCategoryID,
            string ProjectID,
            string MoTa,
            string NgayKham,
            string GioKham,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_Update", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DatLichKhamID", string.IsNullOrEmpty(DatLichKhamID) ? dbNULL : (object)DatLichKhamID);
                cmd.Parameters.AddWithValue("@DatLichCho", string.IsNullOrEmpty(DatLichCho) ? dbNULL : (object)DatLichCho);
                cmd.Parameters.AddWithValue("@HoTen", string.IsNullOrEmpty(HoTen) ? dbNULL : (object)HoTen);
                cmd.Parameters.AddWithValue("@NgaySinh", string.IsNullOrEmpty(NgaySinh) ? dbNULL : (object)NgaySinh);
                cmd.Parameters.AddWithValue("@GioiTinh", string.IsNullOrEmpty(GioiTinh) ? dbNULL : (object)GioiTinh);
                cmd.Parameters.AddWithValue("@DienThoai", string.IsNullOrEmpty(DienThoai) ? dbNULL : (object)DienThoai);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@ProjectID", string.IsNullOrEmpty(ProjectID) ? dbNULL : (object)ProjectID);
                cmd.Parameters.AddWithValue("@MoTa", string.IsNullOrEmpty(MoTa) ? dbNULL : (object)MoTa);
                cmd.Parameters.AddWithValue("@NgayKham", string.IsNullOrEmpty(NgayKham) ? dbNULL : (object)NgayKham);
                cmd.Parameters.AddWithValue("@GioKham", string.IsNullOrEmpty(GioKham) ? dbNULL : (object)GioKham);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_Update' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int DatLichKhamQuickUpdate(
            string DatLichKhamID,
            string IsAvailable,
            string Priority
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_QuickUpdate", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DatLichKhamID", string.IsNullOrEmpty(DatLichKhamID) ? dbNULL : (object)DatLichKhamID);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_QuickUpdate' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public int DatLichKhamDelete(
            string DatLichKhamID
        )
        {
            try
            {
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_Delete", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DatLichKhamID", string.IsNullOrEmpty(DatLichKhamID) ? dbNULL : (object)DatLichKhamID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                scon.Open();
                int success = cmd.ExecuteNonQuery();
                scon.Close();

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_Delete' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return success;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable DatLichKhamSelectAll(
            string HoTen,
            string DienThoai,
            string Email,
            string ProjectCategoryID,
            string ProjectID,
            string NgayKham,
            string GioKham,
            string FromDate,
            string ToDate,
            string IsAvailable,
            string Priority,
            string SortByPriority
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_SelectAll", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@HoTen", string.IsNullOrEmpty(HoTen) ? dbNULL : (object)HoTen);
                cmd.Parameters.AddWithValue("@DienThoai", string.IsNullOrEmpty(DienThoai) ? dbNULL : (object)DienThoai);
                cmd.Parameters.AddWithValue("@Email", string.IsNullOrEmpty(Email) ? dbNULL : (object)Email);
                cmd.Parameters.AddWithValue("@ProjectCategoryID", string.IsNullOrEmpty(ProjectCategoryID) ? dbNULL : (object)ProjectCategoryID);
                cmd.Parameters.AddWithValue("@ProjectID", string.IsNullOrEmpty(ProjectID) ? dbNULL : (object)ProjectID);
                cmd.Parameters.AddWithValue("@NgayKham", string.IsNullOrEmpty(NgayKham) ? dbNULL : (object)NgayKham);
                cmd.Parameters.AddWithValue("@GioKham", string.IsNullOrEmpty(GioKham) ? dbNULL : (object)GioKham);
                cmd.Parameters.AddWithValue("@FromDate", string.IsNullOrEmpty(FromDate) ? dbNULL : (object)FromDate);
                cmd.Parameters.AddWithValue("@ToDate", string.IsNullOrEmpty(ToDate) ? dbNULL : (object)ToDate);
                cmd.Parameters.AddWithValue("@IsAvailable", string.IsNullOrEmpty(IsAvailable) ? dbNULL : (object)IsAvailable);
                cmd.Parameters.AddWithValue("@Priority", string.IsNullOrEmpty(Priority) ? dbNULL : (object)Priority);
                cmd.Parameters.AddWithValue("@SortByPriority", string.IsNullOrEmpty(SortByPriority) ? dbNULL : (object)SortByPriority);

                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_SelectAll' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public DataTable DatLichKhamSelectOne(
            string DatLichKhamID
        )
        {
            try
            {
                var dt = new DataTable();
                var scon = new SqlConnection(connectionString);
                var cmd = new SqlCommand("usp_DatLichKham_SelectOne", scon);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@DatLichKhamID", string.IsNullOrEmpty(DatLichKhamID) ? dbNULL : (object)DatLichKhamID);
                SqlParameter errorCodeParam = new SqlParameter("@ErrorCode", null);
                errorCodeParam.Size = 4;
                errorCodeParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorCodeParam);
                var sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);

                if (errorCodeParam.Value.ToString() != "0")
                    throw new Exception("Stored Procedure 'usp_DatLichKham_SelectOne' reported the ErrorCode : " + errorCodeParam.Value.ToString());

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
