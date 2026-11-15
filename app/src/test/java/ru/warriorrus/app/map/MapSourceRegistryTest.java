package ru.warriorrus.app.map;

import static org.junit.Assert.*;
import org.junit.Test;

/** Regression checks for the explicit map-source allowlist. */
public class MapSourceRegistryTest {
  @Test public void standardMapHasHttpsTemplateAndAttribution() {
    MapSourceRegistry.Source osm = MapSourceRegistry.find("osm-standard");
    assertNotNull(osm);
    assertEquals("https://tile.openstreetmap.org/{z}/{x}/{y}.png", osm.tileUrlTemplate);
    assertTrue(osm.networkRequired);
    assertTrue(osm.minZoom <= osm.maxZoom);
    assertTrue(osm.attribution.contains("OpenStreetMap"));
  }

  @Test public void unknownSourceCannotBeSelected() {
    assertNull(MapSourceRegistry.find("not-approved"));
    assertNull(MapSourceRegistry.find(null));
  }

  @Test public void registryIsImmutableAndHasUniqueIds() {
    java.util.Set<String> ids = new java.util.HashSet<>();
    for (MapSourceRegistry.Source source : MapSourceRegistry.all()) {
      assertTrue(ids.add(source.id));
      assertTrue(source.tileUrlTemplate.startsWith("https://"));
    }
    try {
      MapSourceRegistry.all().clear();
      fail("Map source allowlist must be immutable");
    } catch (UnsupportedOperationException expected) {
      // Correct: runtime code cannot silently modify the approved list.
    }
  }
}
