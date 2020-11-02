<%--
  ~ Copyright (c) 2019, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~ WSO2 Inc. licenses this file to you under the Apache License,
  ~ Version 2.0 (the "License"); you may not use this file except
  ~ in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing,
  ~ software distributed under the License is distributed on an
  ~ "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~ KIND, either express or implied.  See the License for the
  ~ specific language governing permissions and limitations
  ~ under the License.
  --%>
<%@include file="../localize.jsp" %>
<!-- localize.jsp MUST already be included in the calling script -->
<%@ page import="org.wso2.carbon.identity.application.authentication.endpoint.util.AuthenticationEndpointUtil" %>

<!-- header -->
<header class="header header-default">
    <div class="container-fluid"><br></div>
    <div class="container-fluid">
        <div class="pull-left brand float-remove-xs text-center-xs">
            <a href="#">
                <img src="images/powered_Micado_white.png"
                    alt="<%=AuthenticationEndpointUtil.i18n(resourceBundle, "business.name")%>"
                    title="<%=AuthenticationEndpointUtil.i18n(resourceBundle, "business.name")%>" class="logo">
                <h1><em><%=AuthenticationEndpointUtil.i18n(resourceBundle, "identity.server")%></em></h1>
            </a>
        </div>
    </div>

    <style type="text/css">
        body {
            background: #ffffff;
            color: #000000;
        }

        .logo-container {
            padding: 15px 30px;
        }

        header .brand img.logo {
            height: 40px;
        }

        .wr-title {
            background: #FF7C44 !important;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .header {
            background: #0F3A5D;
            min-height: 70px;
            border-bottom: 1px solid #31314b;
        }

        .boarder-all {
            background: #ffffff;
            border: 0;
            position: relative;
            width: 100%;
            margin-bottom: 30px;
            box-shadow: 0 1px 20px 0 rgba(0, 0, 0, .1);
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }

        .wr-login input[type=text],
        .wr-login input[type=password] {
            height: 45px;
            padding: 10px 15px;
            font-size: 1.3rem;
            line-height: 1.42857;
            color: #000000;
            background-color: #F6F6F6;
            background-clip: padding-box;
            border: 1px solid #cad1d7;
            box-shadow: none;
            border-color: #cad1d7;
            border-radius: 10px;
        }

        .wr-btn {
            background: #FF7C44 !important;
            border-radius: 50px;
        }

        .form-group label {
            font-weight: normal;
        }

        .wr-login input[type=text]:focus,
        .wr-login input[type=password]:focus {
            border-color: #FF7C44;
        }

        .alert-warning {
            background: #cad1d7;
            color: #000000;
            border: 1px solid #f8b01e;
            margin-bottom: 10px;
        }

        .footer {
            border-top: 1px solid #31314b;
            background: #1e1e2f;
            min-height: 70px;
        }

        .footer p {
            text-align: center;
            margin-top: 20px;
        }

        .checkbox {
            margin-bottom: 0;
        }

        a {
            color: #FF7C44;
        }

        a:hover,
        a:active {
            color: #FF7C44;
        }
    </style>
</header>