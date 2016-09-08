<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:nm1="http://students.demo.org" xmlns:nm2="http://ws.wso2.org/dataservice" version="2.0">
      <xsl:template match="/">
         <StudentData xmlns="http://ws.apache.org/ns/synapse">
            <StudentID>
               <xsl:value-of select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/StudentID"/>
            </StudentID>
            <FirstName>
               <xsl:value-of select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/FirstName"/>
            </FirstName>
            <LastName>
               <xsl:value-of select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/LastName"/>
            </LastName>
            <GradeBook>
               <xsl:value-of select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/GradeBook"/>
            </GradeBook>
            <Validity>
               <xsl:value-of select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/Validity"/>
            </Validity>
            <ClassData>
               <xsl:for-each select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/ClassData/nm2:Classes">
                  <Classes>
                     <ClassID>
                        <xsl:value-of select="nm2:ClassID"/>
                     </ClassID>
                     <ClassName>
                        <xsl:value-of select="nm2:ClassName"/>
                     </ClassName>
                     <xsl:variable name="dt" select="nm2:ClassStartDate"/>
                     <ClassStartDate>
                        <xsl:value-of select="format-dateTime($dt, '[M01][D01][Y0001]')"/>
                     </ClassStartDate>
                  </Classes>
               </xsl:for-each>
               <xsl:for-each select="nm1:getClassesForStudentResponse/nm1:return/nm2:StudentData/ClassData/Classes">
                  <Classes>
                     <ClassID>
                        <xsl:value-of select="ClassID"/>
                     </ClassID>
                     <ClassName>
                        <xsl:value-of select="ClassName"/>
                     </ClassName>
                     <ProfName>
                        <xsl:value-of select="ProfName"/>
                     </ProfName>
                  </Classes>
               </xsl:for-each>
            </ClassData>
         </StudentData>
      </xsl:template>
   </xsl:stylesheet>