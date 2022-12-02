package com.example.common;

import com.example.SuggestionDAO.SuggestionDAO;
import com.example.SuggestionVO.SuggestionVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload{
    public SuggestionVO uploadPhoto(HttpServletRequest request){
        String filename = "";
        int sizeLimit = 15 *1024*1024;

        String realPath = request.getServletContext().getRealPath("./upload");
        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        SuggestionVO one = null;
        MultipartRequest multipartRequest = null;
        try {
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
            filename = multipartRequest.getFilesystemName("photo");
            one = new SuggestionVO();
            String personID = multipartRequest.getParameter("personID");
            if(personID!=null && !personID.equals("")) one.setPersonID(Integer.parseInt(personID));
            one.setName(multipartRequest.getParameter("name"));
            one.setNickname(multipartRequest.getParameter("nickname"));
            one.setS_number(Integer.parseInt(multipartRequest.getParameter("s_number")));
            one.setMajor(multipartRequest.getParameter("major"));
            one.setDepartment(multipartRequest.getParameter("department"));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setSuggestions(multipartRequest.getParameter("suggestions"));

            if(personID!=null && !personID.equals("")){
                SuggestionDAO dao = new SuggestionDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(personID));
                if(filename !=null && oldfilename != null)
                    FileUpload.deleteFile(request, oldfilename);
                else if(filename==null && oldfilename!=null)
                    filename = oldfilename;
            }
            one.setphoto(filename);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("./upload");
        File f = new File(filePath + "/" + filename);
        if( f.exists()) f.delete();
    }
}