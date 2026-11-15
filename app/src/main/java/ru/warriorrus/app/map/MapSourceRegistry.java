package ru.warriorrus.app.map;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Explicit allowlist for map sources. Only sources with known endpoints and usage rights
 * should be added here. This registry never reads or transmits user-created objects.
 *
 * A source entry is metadata, not a network request or an osmdroid tile provider.
 */
public final class MapSourceRegistry {
    public static final class Source {
        public final String id;
        public final String title;
        public final String tileUrlTemplate;
        public final int minZoom;
        public final int maxZoom;
        public final boolean networkRequired;
        public final String attribution;

        private Source(String id, String title, String tileUrlTemplate,
                       int minZoom, int maxZoom, boolean networkRequired,
                       String attribution) {
            if (id == null || id.trim().isEmpty()) throw new IllegalArgumentException("id");
            if (title == null || title.trim().isEmpty()) throw new IllegalArgumentException("title");
            if (minZoom < 0 || maxZoom < minZoom) throw new IllegalArgumentException("zoom");
            if (networkRequired && (tileUrlTemplate == null ||
                    !tileUrlTemplate.startsWith("https://"))) {
                throw new IllegalArgumentException("Only HTTPS network sources are allowed");
            }
            this.id = id;
            this.title = title;
            this.tileUrlTemplate = tileUrlTemplate;
            this.minZoom = minZoom;
            this.maxZoom = maxZoom;
            this.networkRequired = networkRequired;
            this.attribution = attribution;
        }
    }

    private static final List<Source> SOURCES;
    static {
        List<Source> entries = new ArrayList<>();
        // This entry describes the existing OSM option; it does not change the
        // application's current tile source or grant bulk-download permission.
        entries.add(new Source("osm-standard", "OpenStreetMap",
                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                0, 19, true, "© OpenStreetMap contributors"));
        SOURCES = Collections.unmodifiableList(entries);
    }

    private MapSourceRegistry() {}

    public static List<Source> all() { return SOURCES; }

    public static Source find(String id) {
        if (id == null) return null;
        for (Source source : SOURCES) {
            if (source.id.equals(id)) return source;
        }
        return null;
    }
}
