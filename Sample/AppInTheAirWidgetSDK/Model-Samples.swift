//
//  FlightInfo+Sample.swift
//  AppInTheAirWidgetSDK
//
//  Created by Sergey Pronin on 10/23/15.
//  Copyright © 2015 App in the Air. All rights reserved.
//

import UIKit
import WidgetSDK

extension Airport {
    class var sampleAirport_SVO: Airport {
        let airport = Airport()
        airport.city = "Moscow"
        airport.code = "SVO"
        airport.name = "Sheremetyevo Airport"
        airport.offset = 3
        airport.latitude = 55.966324
        airport.longitude = 37.416573
        airport.country = "RU"
        airport.countryFullName = "Russian Federation"
        return airport
    }

    
    class var sampleAirport_JFK: Airport {
        let airport = Airport()
        airport.city = "New York"
        airport.code = "JFK"
        airport.name = "John F. Kennedy International Airport"
        airport.offset = -4
        airport.latitude = 40.642334
        airport.longitude = -73.78817
        airport.country = "US"
        airport.countryFullName = "United States"
        return airport
    }
    
    class var sampleAirport_CDG: Airport {
        let airport = Airport()
        airport.city = "Paris"
        airport.code = "CDG"
        airport.name = "Charles de Gaulle Airport"
        airport.offset = -4
        airport.latitude = 40.642334
        airport.longitude = -73.78817
        airport.country = "FR"
        airport.countryFullName = "France"
        return airport
    }
}

extension Airline {
    class var sampleAirline: Airline {
        let airline = Airline()
        airline.code = "DL"
        airline.iataCode = "DL"
        airline.icaoCode = "DAL"
        airline.name = "Delta Airlines"
        return airline
    }
}

extension Aircraft {
    class var sampleAircraft: Aircraft {
        let aircraft = Aircraft()
        aircraft.model = "F100"
        aircraft.name = "Fokker 100"
        aircraft.code = "100"
        return aircraft
    }
}

extension FlightInfo {
    class var sampleFlight: FlightInfo {
        let flight = FlightInfo()
        flight.airportOrigin = Airport.sampleAirport_SVO
        flight.airportDestination = Airport.sampleAirport_CDG
        flight.airlineCode = "DL"
        flight.airline = Airline.sampleAirline
        flight.aircraft = "100"
        flight.aircraftObject = Aircraft.sampleAircraft
        flight.number = "100"
        flight.departureDatetime = NSDate(timeIntervalSinceNow: 3600)
        flight.arrivalDatetime = NSDate(timeIntervalSinceNow: 12*3600)
        flight.flightID = "sample"
        flight.departureGate = "40"
        flight.departureTerminal = "F"
        flight.arrivalGate = "88"
        flight.arrivalTerminal = "A"
        return flight
    }
}


extension Trip {
    class var sampleTrip: Trip {
        let trip = Trip()
        let flight = FlightInfo.sampleFlight
        flight.trip = trip
        trip.departureDatetime = flight.departureDatetime
        trip.departureDatetimeUTC = flight.departureDatetimeUTC
        trip.arrivalDatetime = flight.arrivalDatetime
        trip.arrivalDatetimeUTC = flight.arrivalDatetimeUTC
        trip.tripID = "sample"
        trip.flights = NSOrderedSet(object: flight)
        trip.arrivalAirportCode = "LED"
        return trip
    }
}
