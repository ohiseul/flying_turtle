<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/canvas.js"/>"></script>
    
  <div class="jb_table">
    <div class="row">
      <span class="cell" width="82px">
        <div>
          <div class="jb_table">
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/red.png"/>" onclick="selectColor('red')" />
                <img src="<c:url value="/resources/images/canvas/img/orange.png"/>" onclick="selectColor('orange')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/yellow.png"/>" onclick="selectColor('yellow')" />
                <img src="<c:url value="/resources/images/canvas/img/green.png"/>" onclick="selectColor('green')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/blue.png"/>" onclick="selectColor('blue')" />
                <img src="<c:url value="/resources/images/canvas/img/lightblue.png"/>" onclick="selectColor('lightblue')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/lightgreen.png"/>" onclick="selectColor('lightgreen')"/>
                <img src="<c:url value="/resources/images/canvas/img/brown.png"/>" onclick="selectColor('brown')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/purple.png"/>" onclick="selectColor('purple')" />
                <img src="<c:url value="/resources/images/canvas/img/pink.png"/>" onclick="selectColor('pink')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/gray.png"/>" onclick="selectColor('gray')" />
                <img src="<c:url value="/resources/images/canvas/img/lightgray.png"/>" onclick="selectColor('lightgray')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/black.png"/>" onclick="selectColor('black')"/>
                <img src="<c:url value="/resources/images/canvas/img/white.png"/>" onclick="selectColor('white')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/pencil.png"/>"  onclick="selectTool('pencil')" />
                <img src="<c:url value="/resources/images/canvas/img/line.png"/>"  onclick="selectTool('line')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/circle.png"/>" onclick="selectTool('circle')"/>
                <img src="<c:url value="/resources/images/canvas/img/filledcircle.png"/>" onclick="selectTool('filledcircle')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/square.png"/>" onclick="selectTool('square')"/>
                <img src="<c:url value="/resources/images/canvas/img/filledsquare.png"/>" onclick="selectTool('filledsquare')"/>
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/rect.png"/>" onclick="selectTool('rect')" />
                <img src="<c:url value="/resources/images/canvas/img/filledrect.png"/>" onclick="selectTool('filledrect')" />
              </span>
            </div>
            <div class="row">
              <span class="cell">
                <img src="<c:url value="/resources/images/canvas/img/triangle.png"/>" onclick="selectTool('tri')" />
                <img src="<c:url value="/resources/images/canvas/img/filledtriangle.png"/>" onclick="selectTool('filledtri')" />
              </span>
            </div>
            <div class="row">
                <span class="cell">
                  <img src="<c:url value="/resources/images/canvas/img/undo.png"/>" onclick="undo()"/>
                  <img src="<c:url value="/resources/images/canvas/img/redo.png"/>" onclick="redo()"/>
                </span>
              </div>
          </div>
        </div>
      </span>
      <span class="cell">
        <div>
          <canvas id="canvas" width="720px" height="720px"></canvas>
        </div>
      </span>
      <span class="cell">
        <INPUT type="file" id="load_filename" value="Load" onChange="loadFile()" />
        <div>Title <input id="title" size="15px" /></div>
        <div>
          <a id="saveImage" download="image.png">
              <INPUT type="button" value="Save" onClick="saveImage()" />
          </a>
          <INPUT type="button" value="Clear" onClick="initPage()" />
          <INPUT type="button" value="History" onClick="showHistory()" />
        </div>
        <div>
          <input type="button" value="Save as Json" onClick="SaveAsJson()" />
          <input type="button" value="Save as Txt" onClick="SaveAsTxt()" />
        </div>
        <div>
          <textarea id="history" cols="40" rows="37" style="display: none;"></textarea>
        </div>
        <div id="command">
        </div>
            <INPUT type="button" value="Redraw" onClick="reDrawCanvas()" />
        <div>
        </div>
      </span>
    </div>
  </div>
    
    <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/painter.js"/>"></script>
    <script type="text/javascript" src="<c:url value="/resources/admin/js/canvas/drawengine.js"/>"></script>
