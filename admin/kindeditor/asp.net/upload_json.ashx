﻿<%@ WebHandler Language="C#" Class="Upload" %>

/**
 * KindEditor ASP.NET
 *
 * 本ASP.NET程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 *
 */

using System;
using System.Collections;
using System.Web;
using System.IO;
using System.Globalization;
using LitJson;
using System.Drawing;

public class Upload : IHttpHandler
{
    private HttpContext context;

    public void ProcessRequest(HttpContext context)
    {
        String aspxUrl = context.Request.Path.Substring(0, context.Request.Path.LastIndexOf("/") + 1);

        //文件保存目录路径
        String savePath = "../../Upload/";

        //文件保存目录URL
        String saveUrl = aspxUrl + "../../Upload/";

        //定义允许上传的文件扩展名
        Hashtable extTable = new Hashtable();
        extTable.Add("ImgUpload", "gif,jpg,jpeg,png,bmp");
        extTable.Add("flash", "swf,flv");
        extTable.Add("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extTable.Add("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        //最大文件大小
        int maxSize = 2000000;
        this.context = context;

        HttpPostedFile imgFile = context.Request.Files["imgFile"];
        if (imgFile == null)
        {
            showError("请选择文件。");
        }

        String dirPath = context.Server.MapPath(savePath);
        if (!Directory.Exists(dirPath))
        {
            showError("上传目录不存在。");
        }

        String dirName = "ImgUpload";
        if (String.IsNullOrEmpty(dirName))
        {
            dirName = "ImgUpload";
        }
        if (!extTable.ContainsKey(dirName))
        {
            showError("目录名不正确。");
        }

        String fileName = imgFile.FileName;
        String fileExt = Path.GetExtension(fileName).ToLower();

        if (imgFile.InputStream == null || imgFile.InputStream.Length > maxSize)
        {
            showError("上传文件大小超过限制。");
        }

        if (String.IsNullOrEmpty(fileExt) || Array.IndexOf(((String)extTable[dirName]).Split(','), fileExt.Substring(1).ToLower()) == -1)
        {
            showError("上传文件扩展名是不允许的扩展名。\n只允许" + ((String)extTable[dirName]) + "格式。");
        }

        //创建文件夹
        dirPath += dirName + "/";
        saveUrl += dirName + "/";
        if (!Directory.Exists(dirPath))
        {
            Directory.CreateDirectory(dirPath);
        }
        //String ymd = DateTime.Now.ToString("yyyyMMdd", DateTimeFormatInfo.InvariantInfo);
        //dirPath += ymd + "/";
        //saveUrl += ymd + "/";
        if (!Directory.Exists(dirPath))
        {
            Directory.CreateDirectory(dirPath);
        }

        String newFileName = Guid.NewGuid().ToString() + fileExt;
        //String newFileName = fileExt;
        String filePath = dirPath + newFileName;

        imgFile.SaveAs(filePath);

        if (fileExt == ".jpg" || fileExt == ".png")
        {
            //string path = context.Server.MapPath();
            
            //加图片水印
            System.Drawing.Image image = System.Drawing.Image.FromFile(filePath);
            //System.Drawing.Image copyImagea = System.Drawing.Image.FromFile(Server.MapPath("images/") + "logoa7.png");
            System.Drawing.Image copyImageb = System.Drawing.Image.FromFile(context.Server.MapPath("../../images/") + "logoa6.png");
            Graphics g = Graphics.FromImage(image);
            //g.DrawImage(copyImagea, new Rectangle(5, 5, copyImagea.Width, copyImagea.Height), 0, 0, copyImagea.Width, copyImagea.Height, GraphicsUnit.Pixel);
            g.DrawImage(copyImageb, new Rectangle(image.Width - 5 - copyImageb.Width, image.Height - 5 - copyImageb.Height, copyImageb.Width, copyImageb.Height), 0, 0, copyImageb.Width, copyImageb.Height, GraphicsUnit.Pixel);
            g.Dispose();
            //保存加水印过后的图片
            //HiddenField1.Value = prepath + Guid.NewGuid().ToString() + fp.FileName.Substring(fp.FileName.LastIndexOf("."));
            
            newFileName = Guid.NewGuid().ToString() + fileExt;
            string newPath = dirPath + newFileName;
            image.Save(newPath);
            image.Dispose();
            copyImageb.Dispose();
            //copyImagea.Dispose();

            //删除原始图片
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }

        String fileUrl = saveUrl + newFileName;

        Hashtable hash = new Hashtable();
        hash["error"] = 0;
        hash["url"] = fileUrl;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    private void showError(string message)
    {
        Hashtable hash = new Hashtable();
        hash["error"] = 1;
        hash["message"] = message;
        context.Response.AddHeader("Content-Type", "text/html; charset=UTF-8");
        context.Response.Write(JsonMapper.ToJson(hash));
        context.Response.End();
    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }
}
