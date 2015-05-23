//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

// 
//                           SimuLTE
// Copyright (C) 2012 Antonio Virdis, Daniele Migliorini, Giovanni
// Accongiagioco, Generoso Pagano, Vincenzo Pii.
// 
// This file is part of a software released under the license included in file
// "license.pdf". This license can be also found at http://www.ltesimulator.com/
// The above file and the present reference are part of the software itself, 
// and cannot be removed from it.
// 
package lte.simulations.networks;

import inet.networklayer.autorouting.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.nodes.ethernet.Eth10M;
import inet.nodes.inet.Router;
import inet.nodes.inet.StandardHost;
import inet.world.radio.ChannelControl;
import lte.corenetwork.binder.LteBinder;
import lte.corenetwork.nodes.Ue;
import lte.corenetwork.nodes.eNodeB;
import lte.corenetwork.nodes.ExtCell;


network MultiCell2
{
    parameters:
        int numExtCells = default(0);
        @display("i=block/network2;bgb=991,558;bgi=background/budapest");
    submodules:
        channelControl: ChannelControl {
            @display("p=50,25;is=s");
        }
        routingRecorder: RoutingTableRecorder {
            @display("p=50,75;is=s");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=50,125");
            config = xmldoc("multi.xml");
            dumpTopology = true;
        }
        binder: LteBinder {
            @display("p=50,175;is=s");
        }
        server: StandardHost {
            @display("p=212,118;is=n;i=device/server");
        }
        router1: Router {
            @display("p=321,136;i=device/smallrouter");
        }
        router2: Router {
            @display("p=614,116;i=device/smallrouter");
        }
        eNodeB1: eNodeB {
            @display("p=391,259;is=vl");
        }
        eNodeB2: eNodeB {
            @display("p=760,125;is=vl");
        }
        ue11: Ue {
            @display("p=275,289");
        }
        ue12: Ue {
            @display("p=477,386");
        }
        ue21: Ue {
            @display("p=789,280");
        }
        ue22: Ue {
            @display("p=915,183");
        }
        extCell[numExtCells]: ExtCell {
            @display("p=100,480;is=vl");
        }
        extCell1[numExtCells]: ExtCell {
            @display("p=374,404;is=vl");
        }
        extCell2[numExtCells]: ExtCell {
            @display("p=492,280;is=vl");
        }
        extCell3[numExtCells]: ExtCell {
            @display("p=268,392;is=vl");
        }
    connections:
        server.pppg++ <--> Eth10M <--> router1.pppg++;
        router1.pppg++ <--> Eth10M <--> router2.pppg++;
        router1.pppg++ <--> Eth10M <--> eNodeB1.ppp;
        router2.pppg++ <--> Eth10M <--> eNodeB2.ppp;
}
