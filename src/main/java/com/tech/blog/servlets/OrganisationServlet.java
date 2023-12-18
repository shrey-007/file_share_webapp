package com.tech.blog.servlets;

import com.tech.blog.dao.OrganisationDao;
import com.tech.blog.entities.Organisation;
import com.tech.blog.helper.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrganisationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("oname");
        String id=req.getParameter("oid");
        String country=req.getParameter("country");
        String city=req.getParameter("city");
        String branch=req.getParameter("branch");

        Organisation organisation=new Organisation(id,name,country,city,branch);
        System.out.println(organisation);
        OrganisationDao organisationDao=new OrganisationDao(ConnectionProvider.getConnection());

        organisationDao.saveOrganisation(organisation);
          resp.sendRedirect("index.jsp");

    }
}
